local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "LUA:PeFileVersion!0.0.0.0"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "LUA:PeFileVersion!1.0.0.0"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:PeOriginalName!microsoft.generatedcode.dll"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "Lua:PeOriginalName!"
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = #L0_1
if L1_1 == 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = ipairs
L2_1 = L0_1
L1_1, L2_1, L3_1 = L1_1(L2_1)
for L4_1, L5_1 in L1_1, L2_1, L3_1 do
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L5_1
  L8_1 = "!app_web_"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 ~= nil then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = #L5_1
  if L6_1 == 31 then
    L6_1 = mp
    L6_1 = L6_1.get_mpattribute
    L7_1 = "LUA:PeFileVersion!0.0.0.0"
    L6_1 = L6_1(L7_1)
    if L6_1 then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
