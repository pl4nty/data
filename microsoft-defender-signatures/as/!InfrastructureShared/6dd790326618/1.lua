local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
end
L2_1 = {}
L3_1 = "captcha"
L4_1 = "robot"
L5_1 = "malware"
L6_1 = "b64 decode:"
L7_1 = "cloudflare"
L8_1 = "ray id:"
L9_1 = "emoji"
L10_1 = "task"
L11_1 = "passed"
L12_1 = "verif"
L13_1 = "unique code"
L14_1 = "response"
L15_1 = "human"
L16_1 = "compressing"
L17_1 = "dispatching"
L18_1 = "detecting"
L19_1 = "packaging"
L20_1 = "starting"
L21_1 = "notifying"
L22_1 = "registering"
L23_1 = "tagging"
L24_1 = "uploading"
L25_1 = "comparing"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L2_1[7] = L9_1
L2_1[8] = L10_1
L2_1[9] = L11_1
L2_1[10] = L12_1
L2_1[11] = L13_1
L2_1[12] = L14_1
L2_1[13] = L15_1
L2_1[14] = L16_1
L2_1[15] = L17_1
L2_1[16] = L18_1
L2_1[17] = L19_1
L2_1[18] = L20_1
L2_1[19] = L21_1
L2_1[20] = L22_1
L2_1[21] = L23_1
L2_1[22] = L24_1
L2_1[23] = L25_1
L3_1 = contains
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
