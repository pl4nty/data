local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.image_path
  if L2_1 ~= nil then
    goto lbl_12
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_12::
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1.image_path
L2_1 = L2_1(L3_1)
L4_1 = L2_1
L3_1 = L2_1.match
L5_1 = "([^\\]+)$"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= "explorer.exe" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetScannedPPID
L3_1 = L3_1()
if L3_1 == "" or L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.GetProcessCommandLine
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = #L4_1
if L5_1 < 50 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = MpCommon
L5_1 = L5_1.GetImagePathFromPid
L6_1 = L3_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = contains
L7_1 = L5_1
L8_1 = {}
L9_1 = "powershell.exe"
L10_1 = "cmd.exe"
L11_1 = "mshta.exe"
L12_1 = "curl.exe"
L13_1 = "msiexec.exe"
L14_1 = "conhost.exe"
L8_1[1] = L9_1
L8_1[2] = L10_1
L8_1[3] = L11_1
L8_1[4] = L12_1
L8_1[5] = L13_1
L8_1[6] = L14_1
L6_1 = L6_1(L7_1, L8_1)
if not L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = contains
L7_1 = L5_1
L8_1 = "powershell.exe"
L6_1 = L6_1(L7_1, L8_1)
if not L6_1 then
  L6_1 = contains
  L7_1 = L4_1
  L8_1 = "powershell"
  L6_1 = L6_1(L7_1, L8_1)
  if not L6_1 then
    goto lbl_92
  end
end
L6_1 = NormalizeCmdline
L7_1 = "powershell"
L8_1 = L4_1
L6_1 = L6_1(L7_1, L8_1)
L0_1 = L6_1
goto lbl_97
::lbl_92::
L6_1 = NormalizeCmdline
L7_1 = "cmd"
L8_1 = L4_1
L6_1 = L6_1(L7_1, L8_1)
L0_1 = L6_1
::lbl_97::
L6_1 = isnull
L7_1 = L0_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = string
L6_1 = L6_1.gsub
L7_1 = L0_1
L8_1 = "[\"'()+]"
L9_1 = ""
L6_1 = L6_1(L7_1, L8_1, L9_1)
L0_1 = L6_1
L6_1 = string
L6_1 = L6_1.lower
L7_1 = L0_1
L6_1 = L6_1(L7_1)
L0_1 = L6_1
L6_1 = MpCommon
L6_1 = L6_1.StringRegExpSearch
L7_1 = "(ht?tps?:\\/\\/[^^\\s\\x22\\x27\\x7C\\x29\\x3B\\x3E\\x3C\\x2C\\x5E\\x60\\x5D\\x7D]+)"
L8_1 = L0_1
L6_1, L7_1 = L6_1(L7_1, L8_1)
if not L6_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
if not L7_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = ExtractPartsFromUri
L9_1 = L7_1
L8_1 = L8_1(L9_1)
if L8_1 == "" or L8_1 == nil then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = L8_1.host
if L9_1 ~= "" then
  L9_1 = L8_1.host
  if L9_1 ~= nil then
    goto lbl_151
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_151::
L9_1 = split
L10_1 = L8_1.host
L11_1 = "%."
L9_1 = L9_1(L10_1, L11_1)
if not L9_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = "."
L11_1 = tostring
L12_1 = #L9_1
L12_1 = L9_1[L12_1]
L11_1 = L11_1(L12_1)
L10_1 = L10_1 .. L11_1
if not L10_1 then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
if L10_1 == ".ru" then
  L11_1 = mp
  L11_1 = L11_1.LOWFI
  return L11_1
end
L11_1 = isSuspTLD
L12_1 = L10_1
L11_1 = L11_1(L12_1)
if L11_1 then
  L11_1 = mp
  L11_1 = L11_1.INFECTED
  return L11_1
end
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
