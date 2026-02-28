local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if L0_1 < 1024 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 1178817357 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = headerpage
L2_1 = 27
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = headerpage
L2_1 = 29
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 1 then
  L0_1 = mp
  L0_1 = L0_1.set_mpattribute
  L1_1 = "Lua:TopLevelSingleFileCAB"
  L0_1(L1_1)
else
  L0_1 = mp
  L0_1 = L0_1.readu_u16
  L1_1 = headerpage
  L2_1 = 29
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 == 2 then
    L0_1 = mp
    L0_1 = L0_1.set_mpattribute
    L1_1 = "Lua:TopLevelDoubleFileCAB"
    L0_1(L1_1)
  else
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 5
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 9
L0_1 = L0_1(L1_1, L2_1)
if L0_1 < 65536 or 786432 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 17
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 44 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = headerpage
L3_1 = 31
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = headerpage
L3_1 = 33
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 1234 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = headerpage
L3_1 = 35
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 37
L1_1 = L1_1(L2_1, L3_1)
if 1008 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readu_u32
L3_1 = headerpage
L4_1 = L1_1 + 1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= 0 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = "Lua:PossibleTechsnabCAB"
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.ENGINEBUILD
if 12140 < L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1 + 8
L3_1 = nil
L4_1 = mp
L4_1 = L4_1.getfilesize
L4_1 = L4_1()
if L0_1 > L4_1 then
  L4_1 = mp
  L4_1 = L4_1.getfilesize
  L4_1 = L4_1()
  L3_1 = L4_1 - L2_1
else
  L3_1 = L0_1 - L2_1
end
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = false
L4_1(L5_1)
L4_1 = mp
L4_1 = L4_1.readfile
L5_1 = L2_1
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.vfo_add_buffer
L6_1 = L4_1
L7_1 = "[CABDATA]"
L8_1 = mp
L8_1 = L8_1.ADD_VFO_TAKE_ACTION_ON_DAD
L5_1(L6_1, L7_1, L8_1)
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
