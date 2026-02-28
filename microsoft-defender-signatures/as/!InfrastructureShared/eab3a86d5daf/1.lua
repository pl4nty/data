local L0_1, L1_1, L2_1, L3_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.integrity_level
L2_1 = MpCommon
L2_1 = L2_1.SECURITY_MANDATORY_HIGH_RID
if L1_1 <= L2_1 then
  L1_1 = MpCommon
  L1_1 = L1_1.GetProcessElevationAndIntegrityLevel
  L2_1 = L0_1.ppid
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L2_1 = next
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if L2_1 then
      L2_1 = L1_1.IntegrityLevel
      if L2_1 then
        L2_1 = L1_1.IntegrityLevel
        L3_1 = MpCommon
        L3_1 = L3_1.SECURITY_MANDATORY_HIGH_RID
        if L2_1 <= L3_1 then
          L2_1 = mp
          L2_1 = L2_1.INFECTED
          return L2_1
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
