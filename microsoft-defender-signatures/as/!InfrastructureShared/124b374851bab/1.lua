local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.utf8p1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.utf8p1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[5]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = this_sigattrlog
      L2_1 = L2_1[5]
      L2_1 = L2_1.utf8p1
      L1_1 = L1_1(L2_1)
      L0_1 = L1_1
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[6]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = string
        L1_1 = L1_1.lower
        L2_1 = this_sigattrlog
        L2_1 = L2_1[6]
        L2_1 = L2_1.utf8p1
        L1_1 = L1_1(L2_1)
        L0_1 = L1_1
      end
    end
  end
end
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.match
  L2_1 = L0_1
  L3_1 = "\\microsoft\\exchange server\\v%d%d\\frontend\\"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "\\frontend\\httpproxy\\owa\\"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 == nil then
      L1_1 = string
      L1_1 = L1_1.match
      L2_1 = L0_1
      L3_1 = "\\microsoft\\exchange server\\v%d%d\\clientaccess\\"
      L1_1 = L1_1(L2_1, L3_1)
      if L1_1 == nil then
        goto lbl_127
      end
    end
  end
  L1_1 = sysio
  L1_1 = L1_1.IsFileExists
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = string
    L1_1 = L1_1.match
    L2_1 = L0_1
    L3_1 = "(.*\\)[^\\]+$"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 then
      L2_1 = bm
      L2_1 = L2_1.trigger_sig
      L3_1 = "TriggerShellPath"
      L4_1 = L1_1
      L2_1(L3_1, L4_1)
    end
    L2_1 = mp
    L2_1 = L2_1.ReportLowfi
    L3_1 = L0_1
    L4_1 = 3467544967
    L2_1(L3_1, L4_1)
    L2_1 = bm
    L2_1 = L2_1.add_related_file
    L3_1 = L0_1
    L2_1(L3_1)
    L2_1 = bm
    L2_1 = L2_1.add_threat_file
    L3_1 = L0_1
    L2_1(L3_1)
    L2_1 = pcall
    L3_1 = reportBmInfo
    L2_1, L3_1 = L2_1(L3_1)
    if not L2_1 and L3_1 then
      L4_1 = bm
      L4_1 = L4_1.add_related_string
      L5_1 = "bmInfoFailReason"
      L6_1 = tostring
      L7_1 = L3_1
      L6_1 = L6_1(L7_1)
      L7_1 = bm
      L7_1 = L7_1.RelatedStringBMReport
      L4_1(L5_1, L6_1, L7_1)
    end
  end
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
::lbl_127::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
