local L0_1, L1_1, L2_1, L3_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1)
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "%-%>%(rtf[0-9]+%)%-%>[a-z].[a-z]$"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
else
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "%-%>%(rtf[0-9]+%)%-%>"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 ~= nil then
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "//LUA:ExeInRTF"
    L1_1(L2_1)
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
