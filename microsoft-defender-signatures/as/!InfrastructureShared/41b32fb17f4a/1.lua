local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.ppid
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L1_1 = L1_1.ppid
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[1]
      L1_1 = L1_1.utf8p1
      L2_1 = this_sigattrlog
      L2_1 = L2_1[1]
      L2_1 = L2_1.utf8p2
      L3_1 = L2_1
      L4_1 = ";"
      L5_1 = L0_1
      L3_1 = L3_1 .. L4_1 .. L5_1
      L4_1 = bm
      L4_1 = L4_1.trigger_sig
      L5_1 = L1_1
      L6_1 = L3_1
      L7_1 = L0_1
      L4_1(L5_1, L6_1, L7_1)
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
