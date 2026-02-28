local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "PACKED_WITH:(SWC)"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "-[DotNetCompressed]->(SWC)"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L1_1 = L1_1 - 1
L2_1 = string
L2_1 = L2_1.find
L3_1 = L0_1
L4_1 = "->"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
L2_1 = L2_1 + 2
L3_1 = mp
L3_1 = L3_1.readu_u16
L4_1 = headerpage
L5_1 = 9
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= 23117 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.getfilesize
L3_1 = L3_1()
if 1048576 < L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = false
L4_1(L5_1)
L4_1 = mp
L4_1 = L4_1.readfile
L5_1 = 8
L6_1 = L3_1 - 8
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.vfo_add_buffer
L6_1 = L4_1
L8_1 = L0_1
L7_1 = L0_1.sub
L9_1 = L2_1
L10_1 = L1_1
L7_1 = L7_1(L8_1, L9_1, L10_1)
L8_1 = mp
L8_1 = L8_1.ADD_VFO_TAKE_ACTION_ON_DAD
L5_1(L6_1, L7_1, L8_1)
L5_1 = mp
L5_1 = L5_1.UfsSetMetadataBool
L6_1 = "DotNetCoreBundleExtracts"
L7_1 = true
L8_1 = true
L5_1(L6_1, L7_1, L8_1)
L5_1 = mp
L5_1 = L5_1.readprotection
L6_1 = true
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
