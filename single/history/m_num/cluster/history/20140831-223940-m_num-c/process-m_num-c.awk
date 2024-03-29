BEGIN {
    min_m_num = 0;
    max_m_num = 20;
    count = 0;
}
{
    m_num = $1;
    valid_time = $2;
    energy_consumption = $3;

    #if (max_m_num < m_num) {
    #    max_m_num = m_num;
    #}

    sum_valid_time += valid_time;
    sum_energy_consumption += energy_consumption;
    ++count;
}
END {
    result1 = "m_num-c_vs_vt"
    result2 = "m_num-c_vs_ec"
    # result3 = "m_num_vs_ee"
#    for (i = min_m_num; i < max_m_num + 1; ++i) {
        avg_valid_time = 1.0 * sum_valid_time / count;
        avg_energy_consumption = 1.0 * sum_energy_consumption / count;
#    }
    for (i = min_m_num; i < max_m_num + 1; ++i) {
        printf("%3d %5.1f\n", i, avg_valid_time) > result1;
    }
    for (i = min_m_num; i < max_m_num + 1; ++i) {
        printf("%3d %15f\n", i, avg_energy_consumption) > result2;
    }
}
