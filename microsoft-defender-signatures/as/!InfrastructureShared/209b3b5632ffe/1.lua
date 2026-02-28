local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L1_1 = this_sigattrlog
L1_1 = L1_1[9]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[9]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = MpCommon
    L1_1 = L1_1.PathToWin32Path
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[9]
    L3_1 = L3_1.utf8p1
    L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L2_1(L3_1)
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
    L0_1 = L1_1
  end
end
L1_1 = pcall
L2_1 = mp
L2_1 = L2_1.ContextualExpandEnvironmentVariables
L3_1 = L0_1
L1_1, L2_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L0_1 = L2_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L0_1
L3_1 = L3_1(L4_1)
L0_1 = L3_1
L4_1 = L0_1
L3_1 = L0_1.match
L5_1 = "([^\\]+)$"
L3_1 = L3_1(L4_1, L5_1)
L4_1 = isnull
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L5_1 = "dbghelp.dll"
L6_1 = "winhttp.dll"
L7_1 = "dbgcore.dll"
L8_1 = "winmm.dll"
L9_1 = "wtsapi32.dll"
L10_1 = "wkscli.DLL"
L11_1 = "srvcli.dll"
L12_1 = "oleacc.dll"
L13_1 = "rasdlg.dll"
L14_1 = "mf.dll"
L15_1 = "credui.dll"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L4_1[5] = L9_1
L4_1[6] = L10_1
L4_1[7] = L11_1
L4_1[8] = L12_1
L4_1[9] = L13_1
L4_1[10] = L14_1
L4_1[11] = L15_1
L5_1 = contains
L6_1 = L3_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.IsKnownFriendlyFile
L6_1 = L0_1
L7_1 = true
L8_1 = false
L5_1 = L5_1(L6_1, L7_1, L8_1)
if not L5_1 then
  L5_1 = sysio
  L5_1 = L5_1.IsFileExists
  L6_1 = L0_1
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L5_1 = sysio
    L5_1 = L5_1.GetFileSize
    L6_1 = L0_1
    L5_1 = L5_1(L6_1)
    if L5_1 < 20000000 then
      L6_1 = bm
      L6_1 = L6_1.add_related_file
      L7_1 = L0_1
      L6_1(L7_1)
    end
  end
  L5_1 = bm
  L5_1 = L5_1.add_related_string
  L6_1 = "DLLSearchHijacking"
  L7_1 = tostring
  L8_1 = L0_1
  L7_1 = L7_1(L8_1)
  L8_1 = bm
  L8_1 = L8_1.RelatedStringBMReport
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
