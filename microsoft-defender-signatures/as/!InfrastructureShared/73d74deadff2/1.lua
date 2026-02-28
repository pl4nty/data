local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  L2_1 = L0_1.ppid
  if L1_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  if L2_1 ~= "" and L2_1 ~= nil then
    L3_1 = TrackPidAndTechnique
    L4_1 = L2_1
    L5_1 = "T1003.002"
    L6_1 = "shadowcopy_create"
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = IsTechniqueObservedForPid
    L4_1 = L2_1
    L5_1 = "iis_exch_web"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L3_1 = IsTechniqueObservedForPid
      L4_1 = L2_1
      L5_1 = "iis_exch_childproc"
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        L3_1 = IsTechniqueObservedForPid
        L4_1 = L2_1
        L5_1 = "webshell_parent"
        L3_1 = L3_1(L4_1, L5_1)
        if not L3_1 then
          goto lbl_46
        end
      end
    end
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
::lbl_46::
L1_1 = mp
L1_1 = L1_1.LOWFI
return L1_1
