local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 2048 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = tostring
L3_1 = headerpage
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
L2_1 = 0
L3_1 = string
L3_1 = L3_1.gsub
L4_1 = L1_1
L5_1 = " "
L6_1 = ""
L3_1 = L3_1(L4_1, L5_1, L6_1)
L1_1 = L3_1
L3_1 = string
L3_1 = L3_1.gsub
L4_1 = L1_1
L5_1 = "`"
L6_1 = ""
L3_1 = L3_1(L4_1, L5_1, L6_1)
L1_1 = L3_1
L3_1 = string
L3_1 = L3_1.gsub
L4_1 = L1_1
L5_1 = "'%+'"
L6_1 = ""
L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1)
L2_1 = L4_1
L1_1 = L3_1
if L2_1 < 20 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.len
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if 2048 < L3_1 then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L1_1
  L5_1 = "%z"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = string
  L4_1 = L4_1.sub
  L5_1 = L1_1
  L6_1 = 1
  L7_1 = L3_1
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  L1_1 = L4_1
end
L3_1 = mp
L3_1 = L3_1.vfo_add_buffer
L4_1 = L1_1
L5_1 = "[StrConcat]"
L6_1 = mp
L6_1 = L6_1.ADD_VFO_TAKE_ACTION_ON_DAD
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
