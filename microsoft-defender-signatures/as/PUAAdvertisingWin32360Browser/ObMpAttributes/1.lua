local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if L0_1 == nil or L1_1 < 10485760 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L0_1.FileDescription
L3_1 = L0_1.InternalName
if L2_1 and L3_1 then
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L2_1
  L4_1 = L4_1(L5_1)
  L2_1 = L4_1
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L3_1 = L4_1
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L2_1
  L6_1 = "360\229\174\137\229\133\168\230\181\143\232\167\136\229\153\168"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "mini_installer"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = "Lua:360Browser"
      L4_1(L5_1)
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
