local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    goto lbl_23
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_23::
L2_1 = isParentPackageManager
L3_1 = L1_1.ppid
L4_1 = true
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[6]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[6]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[6]
    L4_1 = L4_1.utf8p2
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[7]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[7]
    L3_1 = L3_1.utf8p2
    if L3_1 ~= nil then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = this_sigattrlog
      L4_1 = L4_1[7]
      L4_1 = L4_1.utf8p2
      L3_1 = L3_1(L4_1)
      L2_1 = L3_1
  end
  else
    L3_1 = this_sigattrlog
    L3_1 = L3_1[8]
    L3_1 = L3_1.matched
    if L3_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[8]
      L3_1 = L3_1.utf8p2
      if L3_1 ~= nil then
        L3_1 = string
        L3_1 = L3_1.lower
        L4_1 = this_sigattrlog
        L4_1 = L4_1[8]
        L4_1 = L4_1.utf8p2
        L3_1 = L3_1(L4_1)
        L2_1 = L3_1
      end
    end
  end
end
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[9]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[9]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = this_sigattrlog
    L5_1 = L5_1[9]
    L5_1 = L5_1.utf8p1
    L4_1 = L4_1(L5_1)
    L3_1 = L4_1
  end
end
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L2_1
L6_1 = L3_1
L7_1 = 6
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 then
  L4_1 = TrackPidAndTechniqueBM
  L5_1 = "BM"
  L6_1 = "T1485"
  L7_1 = "Impact_DataDestruction_dd"
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = addRelatedProcess
  L4_1()
  L4_1 = reportRelatedBmHits
  L4_1()
  L4_1 = L3_1
  L5_1 = "|"
  L6_1 = L2_1
  L7_1 = "| exit1"
  L4_1 = L4_1 .. L5_1 .. L6_1 .. L7_1
  L5_1 = bm
  L5_1 = L5_1.add_related_string
  L6_1 = "file_metadata"
  L7_1 = L4_1
  L8_1 = bm
  L8_1 = L8_1.RelatedStringBMReport
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L4_1 = string
L4_1 = L4_1.match
L5_1 = L3_1
L6_1 = "/[^/]+$"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == nil or L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L2_1
L7_1 = L4_1
L8_1 = 6
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 then
  L5_1 = TrackPidAndTechniqueBM
  L6_1 = "BM"
  L7_1 = "T1485"
  L8_1 = "Impact_DataDestruction_dd"
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = addRelatedProcess
  L5_1()
  L5_1 = reportRelatedBmHits
  L5_1()
  L5_1 = L3_1
  L6_1 = "|"
  L7_1 = L2_1
  L8_1 = "| exit2"
  L5_1 = L5_1 .. L6_1 .. L7_1 .. L8_1
  L6_1 = bm
  L6_1 = L6_1.add_related_string
  L7_1 = "file_metadata"
  L8_1 = L5_1
  L9_1 = bm
  L9_1 = L9_1.RelatedStringBMReport
  L6_1(L7_1, L8_1, L9_1)
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
