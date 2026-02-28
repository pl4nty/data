local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = ""
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.image_path
  if L2_1 ~= nil then
    goto lbl_13
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_13::
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
if L4_1 then
  L5_1 = #L4_1
  if not (L5_1 <= 60) then
    goto lbl_47
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_47::
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
L6_1 = string
L6_1 = L6_1.lower
L7_1 = L5_1
L6_1 = L6_1(L7_1)
L5_1 = L6_1
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
if L6_1 then
  L6_1 = NormalizeCmdline
  L7_1 = "powershell"
  L8_1 = L4_1
  L6_1 = L6_1(L7_1, L8_1)
  L0_1 = L6_1
else
  L6_1 = NormalizeCmdline
  L7_1 = "cmd"
  L8_1 = L4_1
  L6_1 = L6_1(L7_1, L8_1)
  L0_1 = L6_1
end
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
if not L8_1 then
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
