local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = L0_1.CompanyName
L2_1 = L0_1.ProductName
L3_1 = L0_1.ProductVersion
if L1_1 then
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  L1_1 = L4_1
else
  L1_1 = ""
end
if L2_1 then
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L2_1
  L4_1 = L4_1(L5_1)
  L2_1 = L4_1
else
  L2_1 = ""
end
if L3_1 then
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L3_1 = L4_1
else
  L3_1 = ""
end
if L1_1 ~= "fast corporation ltd" then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
if L2_1 ~= "pc app store" then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L5_1 = L3_1
L4_1 = L3_1.match
L6_1 = "([0-9.]+)"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = compareProductVersion
L6_1 = L4_1
L7_1 = "1.0.0.1091"
L5_1 = L5_1(L6_1, L7_1)
if L5_1 == -1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
