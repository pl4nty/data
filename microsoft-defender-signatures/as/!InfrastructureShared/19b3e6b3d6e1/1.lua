local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.utf8p2
L1_1 = split
L2_1 = L0_1
L3_1 = " "
L1_1 = L1_1(L2_1, L3_1)
L2_1 = {}
L3_1 = "telemetrydv1"
L4_1 = "mdatp"
L5_1 = "wdavdaemonunprivileged"
L6_1 = "wdavdaemonenterprise"
L7_1 = "dlpagent"
L8_1 = "tccd"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L3_1 = #L2_1
L4_1 = 1
L5_1 = #L1_1
L6_1 = 1
for L7_1 = L4_1, L5_1, L6_1 do
  L8_1 = tostring
  L9_1 = L1_1[L7_1]
  L8_1 = L8_1(L9_1)
  L10_1 = L8_1
  L9_1 = L8_1.gsub
  L11_1 = "%W"
  L12_1 = ""
  L9_1 = L9_1(L10_1, L11_1, L12_1)
  L10_1 = #L9_1
  if 3 <= L10_1 then
    L10_1 = 1
    L11_1 = L3_1
    L12_1 = 1
    for L13_1 = L10_1, L11_1, L12_1 do
      L14_1 = L2_1[L13_1]
      L15_1 = string
      L15_1 = L15_1.find
      L16_1 = L14_1
      L17_1 = L9_1
      L18_1 = 1
      L19_1 = true
      L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
      if L15_1 then
        L15_1 = TrackPidAndTechniqueBM
        L16_1 = "BM"
        L17_1 = "T1562.001"
        L18_1 = "DefenseEvasion-FriendlyPkill"
        L15_1(L16_1, L17_1, L18_1)
        L15_1 = mp
        L15_1 = L15_1.INFECTED
        return L15_1
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
