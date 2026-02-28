local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.command_line
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1.command_line
    L1_1 = L1_1(L2_1)
    L2_1 = bm_AddRelatedFileFromCommandLine
    L3_1 = L1_1
    L4_1 = nil
    L5_1 = nil
    L6_1 = 6
    L2_1(L3_1, L4_1, L5_1, L6_1)
  end
end
L1_1 = sms_untrusted_process
L1_1()
L1_1 = mp
L1_1 = L1_1.CLEAN
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p2
  if L2_1 then
    L2_1 = reportGenericRansomware
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.utf8p2
    L4_1 = true
    L2_1 = L2_1(L3_1, L4_1)
    L1_1 = L2_1
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.utf8p2
    if L2_1 then
      L2_1 = reportGenericRansomware
      L3_1 = this_sigattrlog
      L3_1 = L3_1[3]
      L3_1 = L3_1.utf8p2
      L4_1 = true
      L2_1 = L2_1(L3_1, L4_1)
      L1_1 = L2_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
if L1_1 == L2_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
