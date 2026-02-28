local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L1_1 = true
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L0_1 = L2_1.utf8p1
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L0_1 = L2_1.utf8p2
    L1_1 = false
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[4]
      L0_1 = L2_1.utf8p2
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[5]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[5]
        L0_1 = L2_1.utf8p2
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[3]
        L2_1 = L2_1.matched
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[3]
          L0_1 = L2_1.utf8p2
        end
      end
    end
  end
end
L2_1 = IsSenseRelatedProc
L2_1 = L2_1()
if L2_1 == true then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L3_1 = L2_1
L2_1 = L2_1.find
L4_1 = "tamper"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = 7200
L3_1 = 100
L4_1 = AppendToRollingQueue
L5_1 = "TamperingHackTools"
L6_1 = L0_1
L7_1 = 1
L8_1 = L2_1
L9_1 = L3_1
L4_1(L5_1, L6_1, L7_1, L8_1, L9_1)
L4_1 = GetRollingQueueKeys
L5_1 = "TamperingAlerts"
L4_1 = L4_1(L5_1)
if L4_1 ~= nil then
  L5_1 = type
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if L5_1 == "table" then
    L5_1 = "["
    L6_1 = ipairs
    L7_1 = L4_1
    L6_1, L7_1, L8_1 = L6_1(L7_1)
    for L9_1, L10_1 in L6_1, L7_1, L8_1 do
      L11_1 = L5_1
      L12_1 = "|"
      L13_1 = L10_1
      L5_1 = L11_1 .. L12_1 .. L13_1
    end
    L6_1 = L5_1
    L7_1 = "]"
    L5_1 = L6_1 .. L7_1
    if L5_1 ~= "[]" then
      L6_1 = bm
      L6_1 = L6_1.add_related_string
      L7_1 = "TamperingAlertsOnMachine"
      L8_1 = L5_1
      L9_1 = bm
      L9_1 = L9_1.RelatedStringBMReport
      L6_1(L7_1, L8_1, L9_1)
      L6_1 = bm
      L6_1 = L6_1.add_related_string
      L7_1 = "HackToolsOnMachine"
      L8_1 = L0_1
      L9_1 = bm
      L9_1 = L9_1.RelatedStringBMReport
      L6_1(L7_1, L8_1, L9_1)
      L6_1 = bm
      L6_1 = L6_1.add_related_string
      L7_1 = "IsThreatDetection"
      L8_1 = L1_1
      L9_1 = bm
      L9_1 = L9_1.RelatedStringBMReport
      L6_1(L7_1, L8_1, L9_1)
      L6_1 = add_parents
      L6_1()
      L6_1 = reportRelevantUntrustedEntities
      L7_1 = 0
      L6_1(L7_1)
      L6_1 = reportAVExcludedEntities
      L6_1()
      L6_1 = mp
      L6_1 = L6_1.INFECTED
      return L6_1
    end
  end
end
L5_1 = GetRollingQueueKeys
L6_1 = "TamperingHackTools"
L5_1 = L5_1(L6_1)
L6_1 = "["
L7_1 = 0
L8_1 = ipairs
L9_1 = L5_1
L8_1, L9_1, L10_1 = L8_1(L9_1)
for L11_1, L12_1 in L8_1, L9_1, L10_1 do
  L13_1 = L6_1
  L14_1 = "|"
  L15_1 = L12_1
  L6_1 = L13_1 .. L14_1 .. L15_1
  L7_1 = L7_1 + 1
end
L8_1 = L6_1
L9_1 = "]"
L6_1 = L8_1 .. L9_1
if 3 <= L7_1 then
  L8_1 = bm
  L8_1 = L8_1.add_related_string
  L9_1 = "HackToolsOnMachine"
  L10_1 = L6_1
  L11_1 = bm
  L11_1 = L11_1.RelatedStringBMReport
  L8_1(L9_1, L10_1, L11_1)
  L8_1 = bm
  L8_1 = L8_1.add_related_string
  L9_1 = "IsThreatDetection"
  L10_1 = L1_1
  L11_1 = bm
  L11_1 = L11_1.RelatedStringBMReport
  L8_1(L9_1, L10_1, L11_1)
  L8_1 = add_parents
  L8_1()
  L8_1 = reportRelevantUntrustedEntities
  L9_1 = 0
  L8_1(L9_1)
  L8_1 = reportAVExcludedEntities
  L8_1()
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
