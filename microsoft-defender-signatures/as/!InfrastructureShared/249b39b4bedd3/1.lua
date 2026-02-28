local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L1_1 = this_sigattrlog
L1_1 = L1_1[10]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[10]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[10]
    L0_1 = L1_1.utf8p1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[11]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[11]
    L1_1 = L1_1.utf8p1
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[11]
      L0_1 = L1_1.utf8p1
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[12]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[12]
      L1_1 = L1_1.utf8p1
      if L1_1 ~= nil then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[12]
        L0_1 = L1_1.utf8p1
    end
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[13]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[13]
        L1_1 = L1_1.utf8p1
        if L1_1 ~= nil then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[13]
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
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
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
      L3_1 = string
      L3_1 = L3_1.sub
      L4_1 = L2_1
      L5_1 = 1
      L6_1 = 4
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 ~= "~wrd" then
        goto lbl_104
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_104::
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
L4_1 = L4_1.ContextualExpandEnvironmentVariables
L5_1 = L1_1
L4_1 = L4_1(L5_1)
L5_1 = isnull
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  L4_1 = L5_1
else
  L4_1 = L1_1
end
L5_1 = mp
L5_1 = L5_1.IsKnownFriendlyFile
L6_1 = L4_1
L7_1 = true
L8_1 = false
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = sysio
L5_1 = L5_1.IsFileExists
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = bm
  L5_1 = L5_1.add_related_file
  L6_1 = L4_1
  L5_1(L6_1)
  L5_1 = bm
  L5_1 = L5_1.add_threat_file
  L6_1 = L4_1
  L5_1(L6_1)
end
L5_1 = bm
L5_1 = L5_1.add_related_string
L6_1 = "DroppedFile"
L7_1 = L4_1
L8_1 = bm
L8_1 = L8_1.RelatedStringBMReport
L5_1(L6_1, L7_1, L8_1)
L5_1 = bm
L5_1 = L5_1.add_related_string
L6_1 = "DropTarget"
L7_1 = L0_1
L8_1 = bm
L8_1 = L8_1.RelatedStringBMReport
L5_1(L6_1, L7_1, L8_1)
L5_1 = add_parents
L5_1()
L5_1 = TrackFileAndTechnique
L6_1 = L4_1
L7_1 = "T1203:cve_2025_8088_archive_startup_drop"
L8_1 = 1000
L5_1(L6_1, L7_1, L8_1)
L5_1 = TrackPidAndTechniqueBM
L6_1 = "BM"
L7_1 = "T1547.001"
L8_1 = "archive_startup_persistence"
L5_1(L6_1, L7_1, L8_1)
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
