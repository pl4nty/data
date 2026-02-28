local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
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
L5_1 = #L4_1
if 450 < L5_1 then
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
    goto lbl_98
  end
end
L6_1 = NormalizeCmdline
L7_1 = "powershell"
L8_1 = L4_1
L6_1 = L6_1(L7_1, L8_1)
L0_1 = L6_1
goto lbl_103
::lbl_98::
L6_1 = NormalizeCmdline
L7_1 = "cmd"
L8_1 = L4_1
L6_1 = L6_1(L7_1, L8_1)
L0_1 = L6_1
::lbl_103::
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
L8_1 = "[\"'`^()+#&]"
L9_1 = ""
L6_1 = L6_1(L7_1, L8_1, L9_1)
L0_1 = L6_1
L6_1 = string
L6_1 = L6_1.lower
L7_1 = L0_1
L6_1 = L6_1(L7_1)
L0_1 = L6_1
L6_1 = extract_urls
L7_1 = L0_1
L6_1, L7_1 = L6_1(L7_1)
L8_1 = isnull
L9_1 = L7_1
L8_1 = L8_1(L9_1)
if L8_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = ipairs
L9_1 = L7_1
L8_1, L9_1, L10_1 = L8_1(L9_1)
for L11_1, L12_1 in L8_1, L9_1, L10_1 do
  L13_1 = split
  L14_1 = L12_1
  L15_1 = "%."
  L13_1 = L13_1(L14_1, L15_1)
  if not L13_1 then
    L14_1 = mp
    L14_1 = L14_1.CLEAN
    return L14_1
  end
  L14_1 = "."
  L15_1 = tostring
  L16_1 = #L13_1
  L16_1 = L13_1[L16_1]
  L15_1 = L15_1(L16_1)
  L14_1 = L14_1 .. L15_1
  if not L14_1 then
    L15_1 = mp
    L15_1 = L15_1.CLEAN
    return L15_1
  end
  L15_1 = isSuspTLD
  L16_1 = L14_1
  L15_1 = L15_1(L16_1)
  if L15_1 then
    L15_1 = mp
    L15_1 = L15_1.INFECTED
    return L15_1
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
