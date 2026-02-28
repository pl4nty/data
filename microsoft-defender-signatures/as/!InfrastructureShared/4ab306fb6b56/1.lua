local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = mp
    L0_1 = L0_1.ContextualExpandEnvironmentVariables
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p1
    L0_1 = L0_1(L1_1)
    if L0_1 ~= nil then
      L1_1 = sysio
      L1_1 = L1_1.IsFileExists
      L2_1 = L0_1
      L1_1 = L1_1(L2_1)
      if L1_1 then
        L1_1 = mp
        L1_1 = L1_1.IsKnownFriendlyFile
        L2_1 = L0_1
        L3_1 = true
        L4_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1)
        if L1_1 == true then
          L1_1 = mp
          L1_1 = L1_1.CLEAN
          return L1_1
        end
        L1_1 = checkFileLastWriteTime
        L2_1 = L0_1
        L3_1 = 3600
        L1_1 = L1_1(L2_1, L3_1)
        if L1_1 == false then
          L1_1 = TrackPidAndTechniqueBM
          L2_1 = this_sigattrlog
          L2_1 = L2_1[2]
          L2_1 = L2_1.ppid
          L3_1 = "T1071.003"
          L4_1 = "tactic=susptransportdll;filepath:"
          L5_1 = L0_1
          L4_1 = L4_1 .. L5_1
          L1_1(L2_1, L3_1, L4_1)
          L1_1 = bm
          L1_1 = L1_1.add_related_file
          L2_1 = L0_1
          L1_1(L2_1)
          L1_1 = mp
          L1_1 = L1_1.INFECTED
          return L1_1
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
