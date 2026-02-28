local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    goto lbl_61
  end
end
L1_1 = {}
L2_1 = "/.config/systemd/user"
L3_1 = "/dev/shm"
L4_1 = "/etc/cron."
L5_1 = "/etc/crontab"
L6_1 = "/etc/init.d"
L7_1 = "/etc/rc.d/init.d"
L8_1 = "/etc/rc.d/rc"
L9_1 = "/etc/rc.local"
L10_1 = "/etc/systemd/system"
L11_1 = "/lib/systemd/system"
L12_1 = "/tmp"
L13_1 = "/usr/lib/systemd/system"
L14_1 = "/var/lock"
L15_1 = "/var/mail"
L16_1 = "/var/spool/cron"
L17_1 = "/var/spool/cron/crontabs"
L18_1 = "/var/spool/mail"
L19_1 = "/var/tmp"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L1_1[7] = L8_1
L1_1[8] = L9_1
L1_1[9] = L10_1
L1_1[10] = L11_1
L1_1[11] = L12_1
L1_1[12] = L13_1
L1_1[13] = L14_1
L1_1[14] = L15_1
L1_1[15] = L16_1
L1_1[16] = L17_1
L1_1[17] = L18_1
L1_1[18] = L19_1
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
L3_1 = 1
L4_1 = #L1_1
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = L1_1[L6_1]
  L9_1 = L7_1
  L8_1 = L7_1.len
  L8_1 = L8_1(L9_1)
  L10_1 = L2_1
  L9_1 = L2_1.sub
  L11_1 = 0
  L12_1 = L8_1
  L9_1 = L9_1(L10_1, L11_1, L12_1)
  if L9_1 == L7_1 then
    L9_1 = mp
    L9_1 = L9_1.LOWFI
    return L9_1
  end
end
::lbl_61::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
