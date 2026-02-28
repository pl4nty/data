local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 ~= nil and 20480 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.enum_mpattributesubstring
L2_1 = "SCPT:SH/Architecture_"
L1_1 = L1_1(L2_1)
L2_1 = #L1_1
if 7 < L2_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.enum_mpattributesubstring
L3_1 = "SCPT:SH/os_distro_"
L2_1 = L2_1(L3_1)
L3_1 = #L1_1
L4_1 = #L2_1
L3_1 = L3_1 + L4_1
if 6 < L3_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
