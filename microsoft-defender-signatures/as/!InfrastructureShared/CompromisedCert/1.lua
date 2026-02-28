local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = MpDetection
L0_1 = L0_1.ScanResource
L1_1 = "rootcert://"
L0_1(L1_1)
L0_1 = MpDetection
L0_1 = L0_1.ScanResource
L1_1 = "rootcertuser://"
L0_1(L1_1)
L0_1 = MpDetection
L0_1 = L0_1.GetCurrentThreat
L0_1 = L0_1()
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1.Name
L3_1 = "Program:Win32/CompromisedCert.C"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = MpCommon
  L1_1 = L1_1.ExpandEnvironmentVariables
  L2_1 = "%ProgramFiles%"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L2_1 = L1_1
    L3_1 = " (x86)\\Dell"
    L2_1 = L2_1 .. L3_1
    L3_1 = L1_1
    L4_1 = "\\Dell"
    L3_1 = L3_1 .. L4_1
    L4_1 = sysio
    L4_1 = L4_1.IsFolderExists
    L5_1 = L2_1
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L4_1 = MpDetection
      L4_1 = L4_1.ScanResource
      L5_1 = "folder://"
      L6_1 = L2_1
      L5_1 = L5_1 .. L6_1
      L4_1(L5_1)
    end
    L4_1 = sysio
    L4_1 = L4_1.IsFolderExists
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L4_1 = MpDetection
      L4_1 = L4_1.ScanResource
      L5_1 = "folder://"
      L6_1 = L3_1
      L5_1 = L5_1 .. L6_1
      L4_1(L5_1)
    end
  end
end
