local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.len
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    if 4 < L1_1 then
      L1_1 = string
      L1_1 = L1_1.sub
      L2_1 = L0_1
      L3_1 = -4
      L1_1 = L1_1(L2_1, L3_1)
      if L1_1 == ".lnk" then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[1]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[1]
          L1_1 = L1_1.utf8p2
          L2_1 = bm_AddRelatedFileFromCommandLine
          L3_1 = L1_1
          L2_1(L3_1)
        end
        L1_1 = TrackPidAndTechniqueBM
        L2_1 = "BM"
        L3_1 = "T1547.009"
        L4_1 = "persistence_source"
        L1_1(L2_1, L3_1, L4_1)
        L1_1 = TrackPidAndTechniqueBM
        L2_1 = "BM"
        L3_1 = "T1547.009"
        L4_1 = "ShortcutFileInStartup.H"
        L1_1(L2_1, L3_1, L4_1)
        L1_1 = TrackFileAndTechnique
        L2_1 = L0_1
        L3_1 = "T1547.009:persistence_target"
        L1_1(L2_1, L3_1)
        L1_1 = TrackFileAndTechnique
        L2_1 = L0_1
        L3_1 = "T1547.009:ShortcutFileInStartup.H"
        L1_1(L2_1, L3_1)
        L1_1 = mp
        L1_1 = L1_1.INFECTED
        return L1_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
