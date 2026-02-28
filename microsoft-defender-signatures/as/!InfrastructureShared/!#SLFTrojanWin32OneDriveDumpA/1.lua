local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONOPEN
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if L1_1 < 30720000 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = "OneDriveTelemetryStable.dll"
L3_1 = "\\client\\onedrive\\Product\\UX\\Exe\\obj\\amd64\\OneDrive.pdb"
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = false
L4_1(L5_1)
L4_1 = tostring
L5_1 = mp
L5_1 = L5_1.readfile
L6_1 = 0
L7_1 = 200000
L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L5_1(L6_1, L7_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
L5_1 = mp
L5_1 = L5_1.readprotection
L6_1 = true
L5_1(L6_1)
L6_1 = L4_1
L5_1 = L4_1.find
L7_1 = L2_1
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= nil then
  L6_1 = L4_1
  L5_1 = L4_1.find
  L7_1 = L3_1
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= nil then
    L5_1 = mp
    L5_1 = L5_1.GetParentProcInfo
    L5_1 = L5_1()
    if L5_1 ~= nil then
      L6_1 = L5_1.ppid
      if L6_1 ~= nil then
        L6_1 = TrackPidAndTechnique
        L7_1 = L5_1.ppid
        L8_1 = "T1003.001"
        L9_1 = "credentialdumping"
        L10_1 = 86400
        L6_1(L7_1, L8_1, L9_1, L10_1)
      end
    end
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
