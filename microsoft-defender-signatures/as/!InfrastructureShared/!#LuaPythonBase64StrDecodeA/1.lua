local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:FileExtensionAttr!pyd"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Lua:FileExtensionAttr!py"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.get_mpattributesubstring
L1_1 = "PACKED_WITH:[Base64Decode]"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_mpattributevalue
L1_1 = "SCRIPT:Base64StrStart.A"
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if 20480 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = tostring
L3_1 = mp
L3_1 = L3_1.readfile
L4_1 = L0_1
L5_1 = L1_1 - L0_1
L3_1, L4_1, L5_1, L6_1, L7_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "([a-zA-Z0-9%+/]+=?=?)"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.vfo_add_buffer
L5_1 = L3_1
L6_1 = "[Base64Decode]"
L7_1 = mp
L7_1 = L7_1.ADD_VFO_TAKE_ACTION_ON_DAD
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
