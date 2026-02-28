local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 == L1_1 then
  L1_1 = pcall
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_AMSI_APPNAME
  L1_1, L2_1 = L1_1(L2_1, L3_1)
  if L1_1 and L2_1 then
    L3_1 = pcall
    L4_1 = mp
    L4_1 = L4_1.get_contextdata
    L5_1 = mp
    L5_1 = L5_1.CONTEXT_DATA_PROCESSNAME
    L3_1, L4_1 = L3_1(L4_1, L5_1)
    if L3_1 and L4_1 ~= nil then
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L4_1
      L7_1 = "\\msaccess.exe"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 == nil then
        L5_1 = TrackPidAndTechnique
        L6_1 = "AMSI"
        L7_1 = "T1204"
        L8_1 = "UserExecution"
        L5_1(L6_1, L7_1, L8_1)
        L5_1 = mp
        L5_1 = L5_1.INFECTED
        return L5_1
      end
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
