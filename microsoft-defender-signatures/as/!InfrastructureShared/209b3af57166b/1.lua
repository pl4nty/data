local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = 0
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = mp
L2_1 = L2_1.GetParentProcInfo
L3_1 = L1_1.ppid
L2_1 = L2_1(L3_1)
if L2_1 ~= nil then
  L3_1 = IsTacticObservedForPid
  L4_1 = L2_1.ppid
  L5_1 = "CredentialAccess"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = IsTacticObservedForPid
    L4_1 = L2_1.ppid
    L5_1 = "Collection"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L3_1 = IsTacticObservedForPid
      L4_1 = L2_1.ppid
      L5_1 = "Execution"
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        L3_1 = IsTacticObservedForPid
        L4_1 = L2_1.ppid
        L5_1 = "Impact"
        L3_1 = L3_1(L4_1, L5_1)
        if not L3_1 then
          L3_1 = IsTacticObservedForPid
          L4_1 = L2_1.ppid
          L5_1 = "Ingress"
          L3_1 = L3_1(L4_1, L5_1)
          if not L3_1 then
            goto lbl_57
          end
        end
      end
    end
  end
  L3_1 = TrackPidAndTechniqueBM
  L4_1 = L2_1.ppid
  L5_1 = "T1018"
  L6_1 = "Discovery_FileAndDirectoryDiscovery"
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = TrackPidAndTechniqueBM
  L4_1 = L2_1.ppid
  L5_1 = "T1560"
  L6_1 = "Collection"
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = addRelatedProcess
  L3_1()
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  do return L3_1 end
  goto lbl_80
  ::lbl_57::
  L3_1 = GetTechniquesCountForPid
  L4_1 = L2_1.ppid
  L3_1 = L3_1(L4_1)
  L0_1 = L3_1
  if 2 < L0_1 then
    L3_1 = TrackPidAndTechniqueBM
    L4_1 = L2_1.ppid
    L5_1 = "T1018"
    L6_1 = "Discovery_FileAndDirectoryDiscovery"
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = TrackPidAndTechniqueBM
    L4_1 = L2_1.ppid
    L5_1 = "T1560"
    L6_1 = "Collection"
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = addRelatedProcess
    L3_1()
    L3_1 = reportRelatedBmHits
    L3_1()
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
::lbl_80::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
