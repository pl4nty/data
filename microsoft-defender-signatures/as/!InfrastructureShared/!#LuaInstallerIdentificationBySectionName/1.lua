local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = string
L0_1 = L0_1.find
L1_1 = tostring
L2_1 = pesecs
L3_1 = pehdr
L3_1 = L3_1.NumberOfSections
L2_1 = L2_1[L3_1]
L2_1 = L2_1.Name
L1_1 = L1_1(L2_1)
L2_1 = "_winzip_"
L3_1 = 1
L4_1 = true
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if L0_1 ~= nil then
  L0_1 = mp
  L0_1 = L0_1.set_mpattribute
  L1_1 = "LUA:WinZip_winsfx"
  L0_1(L1_1)
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
