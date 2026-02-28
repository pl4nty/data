local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = mp
  L7_1 = L7_1.bitand
  L8_1 = L6_1.reason_ex
  L9_1 = 1
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 == 1 then
    L7_1 = TrackPidAndTechniqueBM
    L8_1 = L6_1.ppid
    L9_1 = "T1105"
    L10_1 = "CommandAndControl"
    L11_1 = 120
    L7_1(L8_1, L9_1, L10_1, L11_1)
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
