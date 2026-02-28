local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_PATH
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1)
if L2_1 == nil or L2_1 == "" or L1_1 == nil or L1_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L1_1
L5_1 = "/([^/]+%.app)/contents/macos"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.GetCertificateInfo
L4_1 = L4_1()
if L4_1 ~= nil then
  L5_1 = #L4_1
  if not (0 < L5_1) then
    goto lbl_62
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_62::
L5_1 = {}
L6_1 = "cleanmymac"
L7_1 = "termius"
L8_1 = "adobe photoshop"
L9_1 = "adobe acrobat"
L10_1 = "pdf editor"
L11_1 = "google docs"
L12_1 = "google drive"
L13_1 = "google calendar"
L14_1 = "chrome helper"
L15_1 = "lastpass"
L16_1 = "1password"
L17_1 = "malwarebytes"
L18_1 = "audacity"
L19_1 = "dropbox"
L20_1 = "shopify"
L21_1 = "thunderbird"
L22_1 = "davinci resolve"
L23_1 = "metatrader"
L24_1 = "hootsuite"
L25_1 = "notion"
L26_1 = "safari"
L27_1 = "office"
L28_1 = "chrome"
L29_1 = "word"
L30_1 = "excel"
L31_1 = "nordvpn"
L32_1 = "express vpn"
L33_1 = "iPhone Backup"
L34_1 = "teamviewer"
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L5_1[4] = L9_1
L5_1[5] = L10_1
L5_1[6] = L11_1
L5_1[7] = L12_1
L5_1[8] = L13_1
L5_1[9] = L14_1
L5_1[10] = L15_1
L5_1[11] = L16_1
L5_1[12] = L17_1
L5_1[13] = L18_1
L5_1[14] = L19_1
L5_1[15] = L20_1
L5_1[16] = L21_1
L5_1[17] = L22_1
L5_1[18] = L23_1
L5_1[19] = L24_1
L5_1[20] = L25_1
L5_1[21] = L26_1
L5_1[22] = L27_1
L5_1[23] = L28_1
L5_1[24] = L29_1
L5_1[25] = L30_1
L5_1[26] = L31_1
L5_1[27] = L32_1
L5_1[28] = L33_1
L5_1[29] = L34_1
L6_1 = {}
L7_1 = "free"
L8_1 = "download"
L9_1 = "pro"
L10_1 = "generator"
L11_1 = "license"
L12_1 = "keygen"
L13_1 = "activator"
L14_1 = "crack"
L15_1 = "full version"
L16_1 = "antivirus"
L17_1 = "resume"
L18_1 = "activation"
L19_1 = "torrent"
L6_1[1] = L7_1
L6_1[2] = L8_1
L6_1[3] = L9_1
L6_1[4] = L10_1
L6_1[5] = L11_1
L6_1[6] = L12_1
L6_1[7] = L13_1
L6_1[8] = L14_1
L6_1[9] = L15_1
L6_1[10] = L16_1
L6_1[11] = L17_1
L6_1[12] = L18_1
L6_1[13] = L19_1
L7_1 = pairs
L8_1 = L5_1
L7_1, L8_1, L9_1 = L7_1(L8_1)
for L10_1, L11_1 in L7_1, L8_1, L9_1 do
  if L11_1 ~= nil then
    L12_1 = string
    L12_1 = L12_1.find
    L13_1 = L3_1
    L14_1 = L11_1
    L15_1 = 1
    L16_1 = true
    L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
    if L12_1 then
      L12_1 = pairs
      L13_1 = L6_1
      L12_1, L13_1, L14_1 = L12_1(L13_1)
      for L15_1, L16_1 in L12_1, L13_1, L14_1 do
        if L16_1 ~= nil then
          L17_1 = string
          L17_1 = L17_1.find
          L18_1 = L3_1
          L19_1 = L16_1
          L20_1 = 1
          L21_1 = true
          L17_1 = L17_1(L18_1, L19_1, L20_1, L21_1)
          if L17_1 then
            L17_1 = mp
            L17_1 = L17_1.INFECTED
            return L17_1
          end
        end
      end
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
