local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.command_line
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetExecutablesFromCommandLine
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = "/var/tmp/"
L5_1 = "/tmp/"
L6_1 = "/home/"
L7_1 = "/srv/ftp/"
L8_1 = "/root/"
L9_1 = "/mnt/"
L10_1 = "/dev/shm/"
L11_1 = "/var/spool/"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L3_1[7] = L10_1
L3_1[8] = L11_1
L4_1 = ipairs
L5_1 = L2_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  if L8_1 then
    L9_1 = sysio
    L9_1 = L9_1.IsFileExists
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if L9_1 then
      L9_1 = ipairs
      L10_1 = L3_1
      L9_1, L10_1, L11_1 = L9_1(L10_1)
      for L12_1, L13_1 in L9_1, L10_1, L11_1 do
        L15_1 = L8_1
        L14_1 = L8_1.sub
        L16_1 = 1
        L17_1 = #L13_1
        L14_1 = L14_1(L15_1, L16_1, L17_1)
        if L14_1 == L13_1 then
          L14_1 = bm
          L14_1 = L14_1.trigger_sig
          L15_1 = "BMScriptExecutionFromSuspiciousLocation"
          L16_1 = L8_1
          L14_1(L15_1, L16_1)
          L14_1 = mp
          L14_1 = L14_1.INFECTED
          return L14_1
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
