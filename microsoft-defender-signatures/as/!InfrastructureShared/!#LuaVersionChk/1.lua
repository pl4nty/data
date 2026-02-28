local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.InternalName
L2_1 = L0_1.OriginalFilename
if L1_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "LUA:2"
  L3_1(L4_1)
  L3_1 = 32
  L4_1 = 47
  L5_1 = 1
  for L6_1 = L3_1, L4_1, L5_1 do
    L7_1 = string
    L7_1 = L7_1.format
    L8_1 = "%c%c%c%c"
    L9_1 = L6_1
    L10_1 = L6_1
    L11_1 = L6_1
    L12_1 = L6_1
    L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1)
    L8_1 = string
    L8_1 = L8_1.find
    L9_1 = L1_1
    L10_1 = L7_1
    L11_1 = 1
    L12_1 = true
    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
    if L8_1 ~= nil then
      L8_1 = mp
      L8_1 = L8_1.set_mpattribute
      L9_1 = "LUA:PEAnomaly_SpecialInternalName"
      L8_1(L9_1)
      break
    end
  end
end
if L2_1 then
  L3_1 = 32
  L4_1 = 47
  L5_1 = 1
  for L6_1 = L3_1, L4_1, L5_1 do
    L7_1 = string
    L7_1 = L7_1.format
    L8_1 = "%c%c%c%c"
    L9_1 = L6_1
    L10_1 = L6_1
    L11_1 = L6_1
    L12_1 = L6_1
    L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1)
    L8_1 = string
    L8_1 = L8_1.find
    L9_1 = L2_1
    L10_1 = L7_1
    L11_1 = 1
    L12_1 = true
    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
    if L8_1 ~= nil then
      L8_1 = mp
      L8_1 = L8_1.set_mpattribute
      L9_1 = "LUA:PEAnomaly_SpecialOrigName"
      L8_1(L9_1)
      break
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
