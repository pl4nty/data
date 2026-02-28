local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L1_1 = this_sigattrlog
L1_1 = L1_1[15]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[15]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[15]
    L0_1 = L1_1.utf8p1
  end
end
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L0_1 = L2_1
if L0_1 == L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = StringEndsWith
L3_1 = L0_1
L4_1 = ".exe"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = checkFileLastWriteTime
L3_1 = L1_1
L4_1 = 3600
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= false then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = checkFileLastWriteTime
L3_1 = L0_1
L4_1 = 3600
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= false then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.IsKnownFriendlyFile
L3_1 = L1_1
L4_1 = true
L5_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.IsKnownFriendlyFile
L3_1 = L0_1
L4_1 = true
L5_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = nil
L3_1 = nil
L4_1 = mp
L4_1 = L4_1.GetMotwHostUrlForFile
L5_1 = L0_1
L4_1, L5_1 = L4_1(L5_1)
L6_1 = mp
L6_1 = L6_1.GetMotwHostUrlForFile
L7_1 = L1_1
L6_1, L7_1 = L6_1(L7_1)
L8_1 = mp
L8_1 = L8_1.GetMotwReferrerUrlForFile
L9_1 = L0_1
L8_1, L9_1 = L8_1(L9_1)
L10_1 = mp
L10_1 = L10_1.GetMotwReferrerUrlForFile
L11_1 = L1_1
L10_1, L11_1 = L10_1(L11_1)
L12_1 = mp
L12_1 = L12_1.GetMotwZoneForFile
L13_1 = L0_1
L12_1, L13_1 = L12_1(L13_1)
L14_1 = mp
L14_1 = L14_1.GetMotwZoneForFile
L15_1 = L1_1
L14_1, L15_1 = L14_1(L15_1)
L16_1 = mp
L16_1 = L16_1.IsKnownFriendlyFile
L17_1 = L0_1
L18_1 = true
L19_1 = false
L16_1 = L16_1(L17_1, L18_1, L19_1)
if not L16_1 then
  L16_1 = ""
end
L17_1 = mp
L17_1 = L17_1.IsKnownFriendlyFile
L18_1 = L1_1
L19_1 = true
L20_1 = false
L17_1 = L17_1(L18_1, L19_1, L20_1)
if not L17_1 then
  L17_1 = ""
end
if L9_1 then
  L18_1 = mp
  L18_1 = L18_1.GetMotwHostUrlForFile
  L19_1 = L9_1
  L18_1 = L18_1(L19_1)
  L2_1 = L18_1
end
if L11_1 then
  L18_1 = mp
  L18_1 = L18_1.GetMotwHostUrlForFile
  L19_1 = L11_1
  L18_1 = L18_1(L19_1)
  L3_1 = L18_1
end
L18_1 = {}
L19_1 = L5_1 or L19_1
if not L5_1 then
  L19_1 = ""
end
L18_1.dll_motw = L19_1
L19_1 = L7_1 or L19_1
if not L7_1 then
  L19_1 = ""
end
L18_1.proc_motw = L19_1
L19_1 = L13_1 or L19_1
if not L13_1 then
  L19_1 = ""
end
L18_1.dll_zone = L19_1
L19_1 = L15_1 or L19_1
if not L15_1 then
  L19_1 = ""
end
L18_1.proc_zone = L19_1
L19_1 = L1_1 or L19_1
if not L1_1 then
  L19_1 = ""
end
L18_1.procPath = L19_1
L19_1 = L0_1 or L19_1
if not L0_1 then
  L19_1 = ""
end
L18_1.dllPath = L19_1
L19_1 = L11_1 or L19_1
if not L11_1 then
  L19_1 = ""
end
L18_1.proc_refUrl = L19_1
L19_1 = L9_1 or L19_1
if not L9_1 then
  L19_1 = ""
end
L18_1.dll_refUrl = L19_1
L19_1 = L16_1 or L19_1
if not L16_1 then
  L19_1 = ""
end
L18_1.dll_friendly = L19_1
L19_1 = L17_1 or L19_1
if not L17_1 then
  L19_1 = ""
end
L18_1.exe_friendly = L19_1
L19_1 = L2_1 or L19_1
if not L2_1 then
  L19_1 = ""
end
L18_1.dll_motw_refer = L19_1
L19_1 = L3_1 or L19_1
if not L3_1 then
  L19_1 = ""
end
L18_1.proc_motw_refer = L19_1
L19_1 = safeJsonSerialize
L20_1 = L18_1
L19_1 = L19_1(L20_1)
L18_1 = L19_1
L19_1 = bm
L19_1 = L19_1.add_related_string
L20_1 = "PotentialSideLoad_info"
L21_1 = L18_1
L22_1 = bm
L22_1 = L22_1.RelatedStringBMReport
L19_1(L20_1, L21_1, L22_1)
L19_1 = bm
L19_1 = L19_1.trigger_sig
L20_1 = "PotentialSideLoad"
L21_1 = tostring
L22_1 = L18_1
L21_1, L22_1 = L21_1(L22_1)
L19_1(L20_1, L21_1, L22_1)
L19_1 = sysio
L19_1 = L19_1.IsFileExists
L20_1 = L0_1
L19_1 = L19_1(L20_1)
if L19_1 then
  L19_1 = mp
  L19_1 = L19_1.ReportLowfi
  L20_1 = L0_1
  L21_1 = 263154785
  L19_1(L20_1, L21_1)
  L19_1 = bm
  L19_1 = L19_1.add_related_file
  L20_1 = L0_1
  L19_1(L20_1)
end
L19_1 = mp
L19_1 = L19_1.INFECTED
return L19_1
