local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = ""
L1_1 = ""
L2_1 = ""
L3_1 = sysio
L3_1 = L3_1.GetFileFsVolumeInformation
L4_1 = "C:"
L3_1 = L3_1(L4_1)
if L3_1 ~= nil then
  L4_1 = L3_1.VolumeSerialNumber
  if L4_1 ~= nil then
    L4_1 = string
    L4_1 = L4_1.format
    L5_1 = "%x"
    L6_1 = L3_1.VolumeSerialNumber
    L4_1 = L4_1(L5_1, L6_1)
    L0_1 = L4_1
  end
end
L4_1 = sysio
L4_1 = L4_1.RegOpenKey
L5_1 = "HKLM\\Software\\Microsoft\\Cryptography"
L4_1 = L4_1(L5_1)
if L4_1 ~= nil then
  L5_1 = sysio
  L5_1 = L5_1.GetRegValueAsString
  L6_1 = L4_1
  L7_1 = "MachineGuid"
  L5_1 = L5_1(L6_1, L7_1)
  L1_1 = L5_1
end
L5_1 = MpCommon
L5_1 = L5_1.ExpandEnvironmentVariables
L6_1 = "%COMPUTERNAME%"
L5_1 = L5_1(L6_1)
L2_1 = L5_1
if L0_1 ~= "" and L1_1 ~= "" and L2_1 ~= "" then
  L5_1 = string
  L5_1 = L5_1.format
  L6_1 = "%s;%s;%s"
  L7_1 = L0_1
  L8_1 = L1_1
  L9_1 = L2_1
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  L6_1 = MpCommon
  L6_1 = L6_1.Base64Encode
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  L5_1 = L6_1
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = string
  L7_1 = L7_1.format
  L8_1 = "MpInternal_researchdata=DhaDeviceInfo=%s"
  L9_1 = L5_1
  L7_1, L8_1, L9_1 = L7_1(L8_1, L9_1)
  L6_1(L7_1, L8_1, L9_1)
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
