local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "microsoft.griffin.mlagilityservice.dll"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pe
L1_1 = L1_1.get_versioninfo
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1.CompanyName
if L2_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  L3_1 = {}
  L3_1["microsoft corporation"] = "Lua:Company_Microsoft"
  L3_1["microsoft corp."] = "Lua:Company_Microsoft"
  L4_1 = L3_1[L2_1]
  if L4_1 ~= nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = L1_1.InternalName
  L5_1 = L1_1.OriginalFilename
  if L4_1 then
    L6_1 = string
    L6_1 = L6_1.lower
    L7_1 = L4_1
    L6_1 = L6_1(L7_1)
    L4_1 = L6_1
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L4_1
    L8_1 = "microsoft."
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if L6_1 == 1 and L5_1 then
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = L5_1
      L6_1 = L6_1(L7_1)
      L5_1 = L6_1
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L5_1
      L8_1 = "microsoft."
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if L6_1 == 1 then
        L7_1 = L4_1
        L6_1 = L4_1.match
        L8_1 = "(.+)%..+"
        L6_1 = L6_1(L7_1, L8_1)
        if L6_1 ~= L2_1 then
          L7_1 = mp
          L7_1 = L7_1.INFECTED
          return L7_1
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
