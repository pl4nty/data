local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_FULL
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = "/var/tmp/"
L3_1 = "/tmp/"
L4_1 = "/dev/shm/"
L5_1 = "/mnt/"
L6_1 = "/root/"
L7_1 = "/srv/ftp/"
L8_1 = "/var/spool/"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L1_1[7] = L8_1
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L8_1 = L0_1
  L7_1 = L0_1.sub
  L9_1 = 1
  L10_1 = #L6_1
  L7_1 = L7_1(L8_1, L9_1, L10_1)
  if L7_1 == L6_1 then
    L7_1 = mp
    L7_1 = L7_1.get_contextdata
    L8_1 = mp
    L8_1 = L8_1.CONTEXT_DATA_PROCESS_PPID
    L7_1 = L7_1(L8_1)
    if L7_1 then
      L8_1 = MpCommon
      L8_1 = L8_1.BmTriggerSig
      L9_1 = L7_1
      L10_1 = "BM_ELFStrippedTrigger"
      L11_1 = L0_1
      L8_1(L9_1, L10_1, L11_1)
    end
    L8_1 = taint
    L9_1 = L0_1
    L10_1 = "stripped_elf_created_taint"
    L11_1 = 3600
    L8_1(L9_1, L10_1, L11_1)
    L8_1 = mp
    L8_1 = L8_1.INFECTED
    return L8_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
