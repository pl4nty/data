local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = L0_1.CompanyName
if L1_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L3_1 = L1_1
  L2_1 = L1_1.gsub
  L4_1 = " "
  L5_1 = "__"
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L1_1 = L2_1
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:PeCompanyName!"
  L4_1 = L1_1
  L3_1 = L3_1 .. L4_1
  L2_1(L3_1)
else
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:PeCompanyName!nil"
  L2_1(L3_1)
end
L2_1 = L0_1.ProductName
if L2_1 then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  L4_1 = L2_1
  L3_1 = L2_1.gsub
  L5_1 = " "
  L6_1 = "__"
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  L2_1 = L3_1
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:PeProductName!"
  L5_1 = L2_1
  L4_1 = L4_1 .. L5_1
  L3_1(L4_1)
else
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:PeProductName!nil"
  L3_1(L4_1)
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
