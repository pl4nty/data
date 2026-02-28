local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L0_1 = L1_1.utf8p2
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[6]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[6]
    L0_1 = L1_1.utf8p2
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[9]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[9]
      L0_1 = L1_1.utf8p2
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[5]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[5]
        L0_1 = L1_1.utf8p1
      else
        L1_1 = this_sigattrlog
        L1_1 = L1_1[8]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[8]
          L0_1 = L1_1.utf8p1
        end
      end
    end
  end
end
L1_1 = "TamperingTracking"
L2_1 = reportSessionInformation
L2_1 = L2_1()
L3_1 = L2_1.User
if L3_1 then
  L3_1 = L2_1.User
  L3_1 = L3_1.UserName
  if L3_1 then
    L3_1 = L1_1
    L4_1 = "-"
    L5_1 = L2_1.User
    L5_1 = L5_1.UserName
    L3_1 = L3_1 .. L4_1 .. L5_1
    L4_1 = GetRollingQueueSumOfValues
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L5_1 = L4_1.sum
      if 0 < L5_1 then
        L5_1 = GetRollingQueue
        L6_1 = L3_1
        L5_1 = L5_1(L6_1)
        L6_1 = bm
        L6_1 = L6_1.add_related_string
        L7_1 = "Tampering_Events_User"
        L8_1 = safeJsonSerialize
        L9_1 = L5_1
        L8_1 = L8_1(L9_1)
        L9_1 = bm
        L9_1 = L9_1.RelatedStringBMReport
        L6_1(L7_1, L8_1, L9_1)
        L6_1 = bm
        L6_1 = L6_1.add_related_string
        L7_1 = "DetectionType"
        L8_1 = L0_1
        L9_1 = bm
        L9_1 = L9_1.RelatedStringBMReport
        L6_1(L7_1, L8_1, L9_1)
        L6_1 = bm
        L6_1 = L6_1.add_related_string
        L7_1 = "DetectionWeight"
        L8_1 = tostring
        L9_1 = L4_1.sum
        L8_1 = L8_1(L9_1)
        L9_1 = bm
        L9_1 = L9_1.RelatedStringBMReport
        L6_1(L7_1, L8_1, L9_1)
        L6_1 = reportRelevantUntrustedEntities
        L7_1 = 0
        L6_1(L7_1)
        L6_1 = mp
        L6_1 = L6_1.INFECTED
        return L6_1
      end
    end
  end
end
L3_1 = GetRollingQueueSumOfValues
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L4_1 = L3_1.sum
  if 0 < L4_1 then
    L4_1 = GetRollingQueue
    L5_1 = L1_1
    L4_1 = L4_1(L5_1)
    L5_1 = bm
    L5_1 = L5_1.add_related_string
    L6_1 = "Tampering_Events_Machine"
    L7_1 = safeJsonSerialize
    L8_1 = L4_1
    L7_1 = L7_1(L8_1)
    L8_1 = bm
    L8_1 = L8_1.RelatedStringBMReport
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = bm
    L5_1 = L5_1.add_related_string
    L6_1 = "DetectionType"
    L7_1 = L0_1
    L8_1 = bm
    L8_1 = L8_1.RelatedStringBMReport
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = bm
    L5_1 = L5_1.add_related_string
    L6_1 = "DetectionWeight"
    L7_1 = tostring
    L8_1 = L3_1.sum
    L7_1 = L7_1(L8_1)
    L8_1 = bm
    L8_1 = L8_1.RelatedStringBMReport
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = reportRelevantUntrustedEntities
    L6_1 = 0
    L5_1(L6_1)
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
