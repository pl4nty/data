local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "PACKED_WITH:(SWC)"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
L1_1 = mp
L1_1 = L1_1.get_mpattributesubstring
L2_1 = "->[pwszlib]->(swc)"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "%->%[pwszlib%].*%->%(swc%)"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.set_mpattribute
L2_1 = "Lua:VpathPwsZlibSwc"
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = headerpage
L3_1 = 9
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 23117 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if 1000000 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = 8
L4_1 = L1_1 - 8
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.vfo_add_buffer
L4_1 = L2_1
L5_1 = "[PwsZlibSwcMZ]"
L6_1 = mp
L6_1 = L6_1.ADD_VFO_TAKE_ACTION_ON_DAD
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
