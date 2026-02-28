local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "tiworker.exe"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "dismhost.exe"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "zscaler-windows"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        goto lbl_39
      end
    end
  end
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
::lbl_39::
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L1_1 = L2_1.utf8p2
  end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[4]
      L1_1 = L2_1.utf8p2
    end
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
    L4_1 = "MasqSuspRenameTargetL2"
    L5_1 = 3600
    L2_1(L3_1, L4_1, L5_1)
    L2_1 = {}
    L3_1 = "T1036.003:masquerading_target"
    L4_1 = "T1036.003:defenseevasion_target"
    L5_1 = "T1036.003:MasqSuspRename.G"
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
