local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "officeclicktorun.exe"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "monitoringhost.exe"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      goto lbl_30
    end
  end
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
::lbl_30::
L1_1 = nil
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L1_1 = L3_1.utf8p1
  end
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L2_1 = L3_1.utf8p2
  end
end
if L1_1 ~= nil then
  L3_1 = sysio
  L3_1 = L3_1.IsFileExists
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = bm
    L3_1 = L3_1.add_related_file
    L4_1 = L1_1
    L3_1(L4_1)
  end
end
if L2_1 ~= nil then
  L3_1 = sysio
  L3_1 = L3_1.IsFileExists
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = bm
    L3_1 = L3_1.add_related_file
    L4_1 = L2_1
    L3_1(L4_1)
    L3_1 = MpCommon
    L3_1 = L3_1.AppendPersistContext
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = L2_1
    L4_1 = L4_1(L5_1)
    L5_1 = "MasqSuspRenameTarget"
    L6_1 = 3600
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = {}
    L4_1 = "T1036.003:masquerading_target"
    L5_1 = "T1036.003:defenseevasion_target"
    L6_1 = "T1036.003:MasqSuspRename.D"
    L3_1[1] = L4_1
    L3_1[2] = L5_1
    L3_1[3] = L6_1
    L4_1 = TrackFileAndTechnique
    L5_1 = L2_1
    L6_1 = L3_1
    L4_1(L5_1, L6_1)
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
