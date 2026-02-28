local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.image_path
if L1_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1.image_path
L1_1 = L1_1(L2_1)
L2_1 = {}
L3_1 = "chrome.exe"
L4_1 = "firefox.exe"
L5_1 = "edge.exe"
L6_1 = "brave.exe"
L7_1 = "opera.exe"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L3_1 = mp
L3_1 = L3_1.GetProcessCommandLine
L4_1 = L0_1.ppid
L3_1 = L3_1(L4_1)
L4_1 = {}
L5_1 = "--utility-sub-type=chrome.mojom.utilwin"
L4_1[1] = L5_1
if L3_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = contains
L6_1 = L1_1
L7_1 = L2_1
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
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
L5_1 = L5_1.GetScannedPPID
L5_1 = L5_1()
if L5_1 == "" or L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.GetProcessCommandLine
L7_1 = L5_1
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
L7_1 = {}
L8_1 = "invoke"
L9_1 = "iex"
L10_1 = "bypass"
L11_1 = "download"
L12_1 = "taskkill"
L13_1 = "get-random"
L14_1 = "-enc"
L15_1 = "base64"
L16_1 = "-e"
L17_1 = "shellcode"
L18_1 = "webrequest"
L19_1 = "iwr"
L20_1 = "irm"
L21_1 = "convert::"
L22_1 = "'"
L23_1 = "^"
L24_1 = "join"
L25_1 = "hidden"
L26_1 = "schtask"
L27_1 = "-exec"
L28_1 = "-nop"
L29_1 = "split"
L30_1 = "unrestricted"
L31_1 = "client"
L32_1 = "new-scheduledtask"
L33_1 = "run"
L34_1 = "#"
L35_1 = "string"
L36_1 = "replace"
L37_1 = "unrestricted"
L38_1 = "char"
L7_1[1] = L8_1
L7_1[2] = L9_1
L7_1[3] = L10_1
L7_1[4] = L11_1
L7_1[5] = L12_1
L7_1[6] = L13_1
L7_1[7] = L14_1
L7_1[8] = L15_1
L7_1[9] = L16_1
L7_1[10] = L17_1
L7_1[11] = L18_1
L7_1[12] = L19_1
L7_1[13] = L20_1
L7_1[14] = L21_1
L7_1[15] = L22_1
L7_1[16] = L23_1
L7_1[17] = L24_1
L7_1[18] = L25_1
L7_1[19] = L26_1
L7_1[20] = L27_1
L7_1[21] = L28_1
L7_1[22] = L29_1
L7_1[23] = L30_1
L7_1[24] = L31_1
L7_1[25] = L32_1
L7_1[26] = L33_1
L7_1[27] = L34_1
L7_1[28] = L35_1
L7_1[29] = L36_1
L7_1[30] = L37_1
L7_1[31] = L38_1
L8_1 = contains
L9_1 = L6_1
L10_1 = L7_1
L8_1 = L8_1(L9_1, L10_1)
if not L8_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
