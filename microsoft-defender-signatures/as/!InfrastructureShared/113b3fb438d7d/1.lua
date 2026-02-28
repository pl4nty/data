local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L0_1 = L1_1.utf8p2
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L0_1 = L1_1.utf8p2
    end
  end
end
L1_1 = bm_AddRelatedFileFromCommandLine
L2_1 = L0_1
L3_1 = nil
L4_1 = nil
L5_1 = 6
L1_1(L2_1, L3_1, L4_1, L5_1)
L1_1 = sms_untrusted_process
L1_1()
L1_1 = mp
L1_1 = L1_1.CLEAN
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.utf8p2
  if L2_1 then
    L2_1 = reportGenericRansomware
    L3_1 = this_sigattrlog
    L3_1 = L3_1[4]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[5]
    L2_1 = L2_1.utf8p2
    if L2_1 then
      L2_1 = reportGenericRansomware
      L3_1 = this_sigattrlog
      L3_1 = L3_1[5]
      L3_1 = L3_1.utf8p2
      L2_1 = L2_1(L3_1)
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
