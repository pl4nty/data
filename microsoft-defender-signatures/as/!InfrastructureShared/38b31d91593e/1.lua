local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L0_1 = L2_1.utf8p1
  end
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L1_1 = L2_1.utf8p2
  end
end
if L0_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.IsFileExists
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = bm
    L2_1 = L2_1.add_related_file
    L3_1 = L0_1
    L2_1(L3_1)
  end
end
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.IsFileExists
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = bm
    L2_1 = L2_1.add_related_file
    L3_1 = L1_1
    L2_1(L3_1)
    L2_1 = MpCommon
    L2_1 = L2_1.AppendPersistContext
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = L1_1
    L3_1 = L3_1(L4_1)
    L4_1 = "MasqSuspRenameTarget"
    L5_1 = 3600
    L2_1(L3_1, L4_1, L5_1)
    L2_1 = {}
    L3_1 = "T1036.003:masquerading_target"
    L4_1 = "T1036.003:defenseevasion_target"
    L5_1 = "T1036.003:MasqSuspRename.A"
    L2_1[1] = L3_1
    L2_1[2] = L4_1
    L2_1[3] = L5_1
    L3_1 = TrackFileAndTechnique
    L4_1 = L1_1
    L5_1 = L2_1
    L3_1(L4_1, L5_1)
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
