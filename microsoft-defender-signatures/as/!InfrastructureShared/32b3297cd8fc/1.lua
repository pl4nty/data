local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = isnull
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = isnull
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    goto lbl_17
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_17::
L0_1 = string
L0_1 = L0_1.match
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.utf8p2
L2_1 = "Config=(.-);Assembly=(.+)"
L0_1, L1_1 = L0_1(L1_1, L2_1)
L2_1 = isnull
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = isnull
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    goto lbl_37
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_37::
L2_1 = mp
L2_1 = L2_1.ContextualExpandEnvironmentVariables
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = ""
end
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.IsKnownFriendlyFile
  L3_1 = L1_1
  L4_1 = true
  L5_1 = false
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if not L2_1 then
    goto lbl_64
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_64::
L3_1 = L1_1
L2_1 = L1_1.lower
L2_1 = L2_1(L3_1)
L3_1 = string
L3_1 = L3_1.match
L4_1 = L1_1
L5_1 = "..*[\\/](.+)"
L3_1 = L3_1(L4_1, L5_1)
L5_1 = L2_1
L4_1 = L2_1.find
L6_1 = "..-:\\windows\\"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L5_1 = L2_1
  L4_1 = L2_1.find
  L6_1 = "\\temp\\"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    goto lbl_103
  end
end
L5_1 = L2_1
L4_1 = L2_1.find
L6_1 = "jetbrains.*\\jetbrains%.platform%.(componentmodel|core|interop|shell|uiinteractive%.shell|util)%.dll$"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L5_1 = L2_1
  L4_1 = L2_1.find
  L6_1 = "jetbrains.*\\(jetbrains-toolbox%.exe|jetbrains%.platform%.installer%.exe|structuredlogger%.dll|taskrunner%.exe%.config)$"
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L5_1 = L2_1
    L4_1 = L2_1.find
    L6_1 = "\\nextgen%.shared%.subprocess%.manager%.dll$"
    L4_1 = L4_1(L5_1, L6_1)
    if not L4_1 then
      L5_1 = L1_1
      L4_1 = L1_1.find
      L6_1 = "msbuildstructuredlogviewer.*\\StructuredLogger.dll$"
      L4_1 = L4_1(L5_1, L6_1)
      if not L4_1 then
        goto lbl_106
      end
    end
  end
end
::lbl_103::
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_106::
L4_1 = bm
L4_1 = L4_1.get_imagepath
L4_1 = L4_1()
L5_1 = isnull
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = MpCommon
L5_1 = L5_1.PathToWin32Path
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L5_1 = isnull
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.ContextualExpandEnvironmentVariables
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L5_1 = isnull
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.IsKnownFriendlyFile
  L6_1 = L4_1
  L7_1 = true
  L8_1 = false
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  if L5_1 then
    goto lbl_151
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_151::
L5_1 = "SuspiciousAppDomainAssembly"
L6_1 = safeJsonSerialize
L7_1 = {}
L7_1.Source = L5_1
L7_1.ConfigPath = L0_1
L7_1.AssemblyPath = L1_1
L7_1.AssemblyName = L3_1
L6_1 = L6_1(L7_1)
L7_1 = bm
L7_1 = L7_1.add_related_string
L8_1 = L5_1
L9_1 = L6_1
L10_1 = bm
L10_1 = L10_1.RelatedStringBMReport
L7_1(L8_1, L9_1, L10_1)
L7_1 = bm
L7_1 = L7_1.set_detection_string
L8_1 = L6_1
L7_1(L8_1)
L7_1 = bm
L7_1 = L7_1.add_threat_file
L8_1 = L0_1
L7_1(L8_1)
L7_1 = bm
L7_1 = L7_1.add_threat_file
L8_1 = L1_1
L7_1(L8_1)
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
