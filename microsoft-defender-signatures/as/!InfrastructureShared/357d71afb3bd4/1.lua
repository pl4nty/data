local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  L2_1 = MpCommon
  L2_1 = L2_1.QueryPersistContext
  L3_1 = L1_1
  L4_1 = "PsExecServiceNonStandardName"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L3_1 = mp
    L3_1 = L3_1.GetParentProcInfo
    L4_1 = L0_1.ppid
    L3_1 = L3_1(L4_1)
    L4_1 = isnull
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = L3_1.image_path
      L4_1 = L4_1(L5_1)
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L4_1
      L7_1 = "\\system32\\services.exe"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 then
        L5_1 = TrackPidAndTechnique
        L6_1 = "CMDHSTR"
        L7_1 = "T1021.002"
        L8_1 = "remoteservice_created_b"
        L5_1(L6_1, L7_1, L8_1)
        L5_1 = mp
        L5_1 = L5_1.INFECTED
        return L5_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
