local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.utf8p2
L1_1 = false
L2_1 = string
L2_1 = L2_1.find
L3_1 = L0_1
L4_1 = "com.apple.quarantine"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 then
  L1_1 = true
else
  L2_1 = StringSplit
  L3_1 = L0_1
  L4_1 = " "
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = 1
  L4_1 = #L2_1
  L5_1 = 1
  for L6_1 = L3_1, L4_1, L5_1 do
    L7_1 = L2_1[L6_1]
    L9_1 = L7_1
    L8_1 = L7_1.sub
    L10_1 = 1
    L11_1 = 1
    L8_1 = L8_1(L9_1, L10_1, L11_1)
    if L8_1 == "-" then
      L8_1 = string
      L8_1 = L8_1.find
      L9_1 = L7_1
      L10_1 = "c"
      L11_1 = 1
      L12_1 = true
      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
      if L8_1 then
        L1_1 = true
      end
    end
  end
end
if L1_1 then
  L2_1 = TrackPidAndTechniqueBM
  L3_1 = "BM"
  L4_1 = "T1553.005"
  L5_1 = "DefenseEvasion-MOTW"
  L2_1(L3_1, L4_1, L5_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
