local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.image_path
  if L2_1 ~= nil then
    goto lbl_20
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_20::
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1.image_path
L2_1 = L2_1(L3_1)
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "\\explorer.exe"
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetProcessCommandLine
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L4_1 = #L3_1
  if not (L4_1 <= 60) then
    goto lbl_44
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_44::
L4_1 = #L3_1
if 450 < L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = "(?:#.*?\\d{3,}[\\s'\"]*$|<#.*?\\d{3,}[\\s'\"]*#>|[-;:]{1,3}\\s*[^#<]{0,100}?\\d{3,}[\\s'\"]*$)"
L5_1 = "(rem\\s+.*?\\d{3,}\\s*$|::\\s*.*?\\d{3,}\\s*$)"
L6_1 = MpCommon
L6_1 = L6_1.GetImagePathFromPid
L7_1 = L0_1
L6_1 = L6_1(L7_1)
if not L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = string
L7_1 = L7_1.lower
L8_1 = L6_1
L7_1 = L7_1(L8_1)
L6_1 = L7_1
L7_1 = contains
L8_1 = L6_1
L9_1 = {}
L10_1 = "powershell.exe"
L11_1 = "cmd.exe"
L12_1 = "mshta.exe"
L13_1 = "conhost.exe"
L14_1 = "curl.exe"
L9_1[1] = L10_1
L9_1[2] = L11_1
L9_1[3] = L12_1
L9_1[4] = L13_1
L9_1[5] = L14_1
L7_1 = L7_1(L8_1, L9_1)
if not L7_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = string
L7_1 = L7_1.lower
L8_1 = L3_1
L7_1 = L7_1(L8_1)
L3_1 = L7_1
L7_1 = string
L7_1 = L7_1.gsub
L8_1 = L3_1
L9_1 = "[\"'`^()+#&]"
L10_1 = ""
L7_1 = L7_1(L8_1, L9_1, L10_1)
L8_1 = {}
L9_1 = "iwr"
L10_1 = "iex"
L11_1 = "irm"
L12_1 = "curl"
L13_1 = "bitsadmin"
L14_1 = "e:jscript"
L15_1 = "downloadstring"
L16_1 = "invoke-restmethod"
L17_1 = "invoke-webrequest"
L18_1 = "invoke-expression"
L19_1 = "start-process"
L20_1 = "c:\\users\\public\\"
L21_1 = "uilevel"
L22_1 = ".installproduct"
L23_1 = "[char]"
L8_1[1] = L9_1
L8_1[2] = L10_1
L8_1[3] = L11_1
L8_1[4] = L12_1
L8_1[5] = L13_1
L8_1[6] = L14_1
L8_1[7] = L15_1
L8_1[8] = L16_1
L8_1[9] = L17_1
L8_1[10] = L18_1
L8_1[11] = L19_1
L8_1[12] = L20_1
L8_1[13] = L21_1
L8_1[14] = L22_1
L8_1[15] = L23_1
L9_1 = contains
L10_1 = L7_1
L11_1 = L8_1
L9_1 = L9_1(L10_1, L11_1)
if L9_1 then
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L9_1 = contains
L10_1 = L6_1
L11_1 = "powershell.exe"
L9_1 = L9_1(L10_1, L11_1)
if L9_1 then
  L9_1 = MpCommon
  L9_1 = L9_1.StringRegExpSearch
  L10_1 = "(?i)[^\\w\\d\\s]w[indowstyle]*\\s+(?:h[iden]*|1|m[inimized]*)\\s+"
  L11_1 = L7_1
  L9_1, L10_1 = L9_1(L10_1, L11_1)
  if L9_1 then
    L11_1 = MpCommon
    L11_1 = L11_1.StringRegExpSearch
    L12_1 = L4_1
    L13_1 = L3_1
    L11_1, L12_1 = L11_1(L12_1, L13_1)
    if L11_1 then
      L13_1 = mp
      L13_1 = L13_1.INFECTED
      return L13_1
    end
  end
end
L9_1 = MpCommon
L9_1 = L9_1.StringRegExpSearch
L10_1 = L5_1
L11_1 = L3_1
L9_1, L10_1 = L9_1(L10_1, L11_1)
if L9_1 then
  L11_1 = mp
  L11_1 = L11_1.INFECTED
  return L11_1
end
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
