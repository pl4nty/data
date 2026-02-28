local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if L0_1 == nil or L1_1 < 8388608 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L0_1.FileDescription
L3_1 = L0_1.InternalName
if L2_1 and L3_1 == nil then
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L2_1
  L4_1 = L4_1(L5_1)
  L2_1 = L4_1
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L2_1
  L6_1 = "2345\229\165\189\229\142\139 v"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "Lua:HaoZip"
    L4_1(L5_1)
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
