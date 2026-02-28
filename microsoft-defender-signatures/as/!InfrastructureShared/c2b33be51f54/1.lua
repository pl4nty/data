local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = TrackPidAndTechniqueBM
L2_1 = L0_1.ppid
L3_1 = "T1562.001"
L4_1 = "mptamper-titokensteal"
L1_1(L2_1, L3_1, L4_1)
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L1_1 = L2_1.p2
  if not L1_1 or L1_1 == "" then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = tonumber
L3_1 = readRegDQwordValue
L4_1 = L1_1
L3_1 = L3_1(L4_1)
L4_1 = 16
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.add_related_string
L4_1 = "OldValue"
L5_1 = tostring
L6_1 = L2_1
L5_1 = L5_1(L6_1)
L6_1 = bm
L6_1 = L6_1.RelatedStringBMReport
L3_1(L4_1, L5_1, L6_1)
L3_1 = 600
L4_1 = 10
L5_1 = AppendToRollingQueue
L6_1 = "MpTamperRegKeyOldValues_Altitude"
L7_1 = string
L7_1 = L7_1.match
L8_1 = this_sigattrlog
L8_1 = L8_1[1]
L8_1 = L8_1.utf8p1
L9_1 = "(.*)\\\\"
L7_1 = L7_1(L8_1, L9_1)
L8_1 = L2_1
L9_1 = L3_1
L10_1 = L4_1
L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
