BEGIN {
    min_hole_num = max_hole_num = 1;
}
{
    hole_num = $1;
    valid_time = $2;
    energy_consumption = $3;

    if (max_hole_num < hole_num) {
        max_hole_num = hole_num;
    }

    sum_valid_time[hole_num] += valid_time;
    sum_energy_consumption[hole_num] += energy_consumption;
    ++count[hole_num];
}
END {
    result1 = "hole-c_vs_vt"
    result2 = "hole-c_vs_ec"
    # result3 = "m_num_vs_ee"
    for (i = min_hole_num; i < max_hole_num + 1; ++i) {
        avg_valid_time[i] = 1.0 * sum_valid_time[i] / count[i];
        avg_energy_consumption[i] = 1.0 * sum_energy_consumption[i] / count[i];
    }
    for (i = min_hole_num; i < max_hole_num + 1; ++i) {
        printf("%3d %5.1f\n", i, avg_valid_time[i]) > result1;
    }
    for (i = min_hole_num; i < max_hole_num + 1; ++i) {
        printf("%3d %15f\n", i, avg_energy_consumption[i]) > result2;
    }
}
