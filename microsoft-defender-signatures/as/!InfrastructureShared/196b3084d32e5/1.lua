local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1, L3_1, L4_1, L5_1 = L2_1()
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[6]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[6]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[6]
    L2_1 = L2_1.utf8p1
    L3_1 = L2_1
    L2_1 = L2_1.lower
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
  end
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "(.*\\)"
L2_1 = L2_1(L3_1, L4_1)
L3_1 = string
L3_1 = L3_1.match
L4_1 = L0_1
L5_1 = "(.*\\)"
L3_1 = L3_1(L4_1, L5_1)
if L2_1 == L3_1 then
  L4_1 = reportSessionInformation
  L4_1()
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
