local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L1_1 = L1_1.utf8p2
    L2_1 = L1_1
    L1_1 = L1_1.lower
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = contains
L2_1 = L0_1
L3_1 = {}
L4_1 = "captcha"
L5_1 = "human"
L6_1 = "robo"
L7_1 = "verif"
L8_1 = "free"
L9_1 = "ray"
L10_1 = "cloudflare"
L11_1 = "microsoft windows"
L12_1 = "telegram"
L13_1 = ".mp3"
L14_1 = ".mp4"
L15_1 = ".flv"
L16_1 = ".mdb"
L17_1 = ".eps"
L18_1 = "-replace"
L19_1 = "DNS service"
L20_1 = ".dat"
L21_1 = ".xll"
L22_1 = ".m4a"
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
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
