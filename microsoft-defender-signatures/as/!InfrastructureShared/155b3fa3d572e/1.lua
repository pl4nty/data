local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.utf8p2
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p2
    if not L3_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    L5_1 = L4_1
    L4_1 = L4_1.match
    L6_1 = "create(.*)binpath"
    L4_1 = L4_1(L5_1, L6_1)
    L1_1 = L4_1
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.utf8p1
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.utf8p1
    L4_1 = L3_1
    L3_1 = L3_1.match
    L5_1 = "([^\\]+)$"
    L3_1 = L3_1(L4_1, L5_1)
    L0_1 = L3_1
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L2_1 = L3_1.image_path
    if not L2_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[3]
      L3_1 = L3_1.ppid
      if not L3_1 then
        L3_1 = ""
      end
      L4_1 = MpCommon
      L4_1 = L4_1.GetImagePathFromPid
      L5_1 = L3_1
      L4_1 = L4_1(L5_1)
      L2_1 = L4_1
    end
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[4]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[4]
  L3_1 = L3_1.utf8p1
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[4]
    L3_1 = L3_1.utf8p1
    L4_1 = L3_1
    L3_1 = L3_1.match
    L5_1 = "([^\\]+)$"
    L3_1 = L3_1(L4_1, L5_1)
    L0_1 = L3_1
    L3_1 = this_sigattrlog
    L3_1 = L3_1[4]
    L3_1 = L3_1.image_path
    L2_1 = L3_1 or L2_1
    if not L3_1 then
      L2_1 = ""
    end
    if not L2_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L3_1 = L3_1.ppid
      if not L3_1 then
        L3_1 = ""
      end
      L4_1 = MpCommon
      L4_1 = L4_1.GetImagePathFromPid
      L5_1 = L3_1
      L4_1 = L4_1(L5_1)
      L2_1 = L4_1 or L2_1
      if not L4_1 then
        L2_1 = ""
      end
    end
  end
end
if not L0_1 or not L1_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = contains
L4_1 = L1_1
L5_1 = L0_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "RegisteredSrv"
  L5_1 = L0_1
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "ProcName_Reg"
  L5_1 = L2_1 or L5_1
  if not L2_1 then
    L5_1 = ""
  end
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = reportRelevantUntrustedEntities
  L4_1 = 0
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L4_1 = next
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L4_1 = bm
      L4_1 = L4_1.add_related_string
      L5_1 = "UntrustedEntities"
      L6_1 = safeJsonSerialize
      L7_1 = L3_1
      L6_1 = L6_1(L7_1)
      L7_1 = bm
      L7_1 = L7_1.RelatedStringBMReport
      L4_1(L5_1, L6_1, L7_1)
    end
  end
  L4_1 = contains
  L5_1 = L2_1
  L6_1 = {}
  L7_1 = "reg.exe"
  L8_1 = "regedit.exe"
  L6_1[1] = L7_1
  L6_1[2] = L8_1
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L4_1 = bm
    L4_1 = L4_1.trigger_sig
    L5_1 = "TEL_SuspSafebootN"
    L6_1 = L0_1
    L7_1 = "|"
    L8_1 = L2_1
    L6_1 = L6_1 .. L7_1 .. L8_1
    L4_1(L5_1, L6_1)
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
