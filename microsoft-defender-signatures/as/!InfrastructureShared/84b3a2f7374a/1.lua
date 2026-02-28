local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.CLEAN
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p2
  if L1_1 then
    L1_1 = reportGenericRansomware
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.utf8p2
    if L1_1 then
      L1_1 = reportGenericRansomware
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L2_1 = L2_1.utf8p2
      L1_1 = L1_1(L2_1)
      L0_1 = L1_1
    end
  end
end
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L1_1 = L1_1.utf8p1
    L2_1 = extractRansomNote
    L3_1 = L1_1
    L2_1(L3_1)
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
if L0_1 == L1_1 then
  L1_1 = reportTimingData
  L1_1()
  L1_1 = sms_untrusted_process
  L1_1()
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
