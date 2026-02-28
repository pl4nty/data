local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.ProductName
if L1_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "wise care"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 then
    L2_1 = L0_1.ProductVersion
    L4_1 = L2_1
    L3_1 = L2_1.match
    L5_1 = "([0-9.]+)"
    L3_1 = L3_1(L4_1, L5_1)
    L4_1 = compareProductVersion
    L5_1 = L3_1
    L6_1 = "6.7.1"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 == 1 then
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = "AllowList:WiseCleaner"
      L4_1(L5_1)
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
