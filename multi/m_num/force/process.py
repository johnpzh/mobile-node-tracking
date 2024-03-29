#! /usr/local/bin/python3
import datetime
import subprocess
import sys

# Do experiments many time
time = datetime.datetime.today()
time_fmt = '%Y%m%d-%H%M%S'
path = time.strftime(time_fmt)
# reuilt files are in 'path/'
result_file = path + '-result'
subprocess.call(['mkdir', path])
argvs = sys.argv
if len(argvs) <= 1:
    count = 2
else:
    count = int(argvs[1])
for i in range(count):
    for num_mnode in range(0, 21):
        subprocess.call(['ns', 'mobile.tcl', str(num_mnode), result_file])

# Process the results
rf = open(result_file, 'r')
vt_file = open('m_num-m-force_vs_vt', 'w')
ec_file = open('m_num-m-force_vs_ec', 'w')
vt = dict()
ec = dict()
for line in rf:
    results = line.split()
    var = int(results[0])
    time = float(results[1])
    energy = float(results[2])
    if not (var in vt.keys()):
        vt[var] = 0.0
        ec[var] = 0.0
    vt[var] += time
    ec[var] += energy
vars = sorted(vt.keys())
for var in vars:
    #print('{0} {1} {2}'.format(var, vt[var]/count, ec[var]/count))
    vt_file.write('{0} {1:.2f}\n'.format(var, vt[var] / count))
    ec_file.write('{0} {1:.2f}\n'.format(var, ec[var] / count))
vt_file.close()
ec_file.close()
rf.close()
subprocess.call(['mv', result_file, path])
subprocess.call(['mv', vt_file.name, path])
subprocess.call(['mv', ec_file.name, path])

f_vt_file = open('m_num-f_vs_vt', 'w')
f_ec_file = open('m_num-f_vs_ec', 'w')
for i in range(0, vars[len(vars) - 1] + 1):
    f_vt_file.write('{0} {1}\n'.format(i, vt[0] / count))
    f_ec_file.write('{0} {1}\n'.format(i, ec[0] / count))
f_vt_file.close()
f_ec_file.close()
subprocess.call(['mv', f_vt_file.name, path])
subprocess.call(['mv', f_ec_file.name, path])
