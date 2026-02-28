local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L0_1 = L1_1.utf8p1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.utf8p1
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L0_1 = L1_1.utf8p1
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[4]
      L1_1 = L1_1.utf8p1
      if L1_1 ~= nil then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[4]
        L0_1 = L1_1.utf8p1
    end
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[5]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[5]
        L1_1 = L1_1.utf8p1
        if L1_1 ~= nil then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[5]
          L0_1 = L1_1.utf8p1
      end
      else
        L1_1 = this_sigattrlog
        L1_1 = L1_1[6]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[6]
          L1_1 = L1_1.utf8p1
          if L1_1 ~= nil then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[6]
            L0_1 = L1_1.utf8p1
        end
        else
          L1_1 = mp
          L1_1 = L1_1.CLEAN
          return L1_1
        end
      end
    end
  end
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "%.%.\\"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "\\([^\\]+)$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
if L2_1 ~= "desktop.ini" and L2_1 ~= "thumbs.db" then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L2_1
  L5_1 = -4
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 ~= ".tmp" then
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L2_1
    L5_1 = 1
    L6_1 = 2
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if L3_1 ~= "~$" then
      goto lbl_122
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_122::
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1 = L3_1()
L4_1 = isnull
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L4_1
  L7_1 = "\\windows defender\\msmpeng.exe"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
L4_1 = mp
L4_1 = L4_1.IsKnownFriendlyFile
L5_1 = L1_1
L6_1 = true
L7_1 = false
L4_1 = L4_1(L5_1, L6_1, L7_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = sysio
L4_1 = L4_1.IsFileExists
L5_1 = L1_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = bm
  L4_1 = L4_1.add_related_file
  L5_1 = L1_1
  L4_1(L5_1)
  L4_1 = bm
  L4_1 = L4_1.add_threat_file
  L5_1 = L1_1
  L4_1(L5_1)
end
L4_1 = bm
L4_1 = L4_1.add_related_string
L5_1 = "TraversalPath"
L6_1 = L1_1
L7_1 = bm
L7_1 = L7_1.RelatedStringBMReport
L4_1(L5_1, L6_1, L7_1)
L4_1 = bm
L4_1 = L4_1.add_related_string
L5_1 = "TraversalType"
L6_1 = L0_1
L7_1 = bm
L7_1 = L7_1.RelatedStringBMReport
L4_1(L5_1, L6_1, L7_1)
L4_1 = add_parents
L4_1()
L4_1 = TrackFileAndTechnique
L5_1 = L1_1
L6_1 = "T1203:cve_2025_8088_path_traversal"
L7_1 = 1000
L4_1(L5_1, L6_1, L7_1)
L4_1 = TrackPidAndTechniqueBM
L5_1 = "BM"
L6_1 = "T1547.001"
L7_1 = "path_traversal_persistence"
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
