local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = sysio
L0_1 = L0_1.RegOpenKey
L1_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\ICM\\Calibration"
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = sysio
  L1_1 = L1_1.GetRegValueAsString
  L2_1 = L0_1
  L3_1 = "DisplayCalibrator"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L2_1 = string
    L2_1 = L2_1.len
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if L2_1 < 4 then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      if L2_1 ~= "cmd" then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
    end
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = L1_1
    L3_1 = L3_1(L4_1)
    L4_1 = "\\dccw.exe"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = set_research_data
    L3_1 = "DefaultValue"
    L4_1 = L1_1
    L5_1 = false
    L2_1(L3_1, L4_1, L5_1)
    L2_1 = mp
    L2_1 = L2_1.GetScannedPPID
    L2_1 = L2_1()
    L3_1 = {}
    L4_1 = table
    L4_1 = L4_1.insert
    L5_1 = L3_1
    L6_1 = L2_1
    L4_1(L5_1, L6_1)
    L4_1 = MpCommon
    L4_1 = L4_1.SetPersistContextNoPath
    L5_1 = "UACBypassRegSet.B"
    L6_1 = L3_1
    L7_1 = 3
    L4_1(L5_1, L6_1, L7_1)
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "MpDisableCaching"
    L4_1(L5_1)
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
