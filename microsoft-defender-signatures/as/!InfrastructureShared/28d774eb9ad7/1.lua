local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L3_1 = ".sysmain.sdb"
L2_1[1] = L3_1
L3_1 = contains
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = "wscript.exe"
L5_1 = "cscript.exe"
L6_1 = "regsvr32.exe"
L7_1 = "mshta.exe"
L8_1 = "vbc.exe"
L9_1 = "msbuild.exe"
L10_1 = "wmic.exe"
L11_1 = "cmstp.exe"
L12_1 = "regasm.exe"
L13_1 = "installutil.exe"
L14_1 = "regsvcs.exe"
L15_1 = "msxsl.exe"
L16_1 = "xwizard.exe"
L17_1 = "csc.exe"
L18_1 = "winword.exe"
L19_1 = "excel.exe"
L20_1 = "powerpnt.exe"
L21_1 = "cmd.exe"
L22_1 = "powershell.exe"
L23_1 = "pwsh.exe"
L24_1 = "forfiles.exe"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L3_1[7] = L10_1
L3_1[8] = L11_1
L3_1[9] = L12_1
L3_1[10] = L13_1
L3_1[11] = L14_1
L3_1[12] = L15_1
L3_1[13] = L16_1
L3_1[14] = L17_1
L3_1[15] = L18_1
L3_1[16] = L19_1
L3_1[17] = L20_1
L3_1[18] = L21_1
L3_1[19] = L22_1
L3_1[20] = L23_1
L3_1[21] = L24_1
L4_1 = MpCommon
L4_1 = L4_1.GetProcessElevationAndIntegrityLevel
L5_1 = L0_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L5_1 = next
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L5_1 = L4_1.IntegrityLevel
    if L5_1 then
      L5_1 = L4_1.IntegrityLevel
      L6_1 = MpCommon
      L6_1 = L6_1.SECURITY_MANDATORY_HIGH_RID
      if L5_1 >= L6_1 then
        L5_1 = IsProcNameInParentProcessTree
        L6_1 = "CMDHSTR"
        L7_1 = L3_1
        L5_1 = L5_1(L6_1, L7_1)
        if L5_1 then
          L5_1 = mp
          L5_1 = L5_1.INFECTED
          return L5_1
        end
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
