local L0_1, L1_1, L2_1
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
if L0_1 == nil then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = checkProductVersion
L1_1 = "LT"
L2_1 = "1.0.252"
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "LUA:Telamon.NewProductVersion"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
