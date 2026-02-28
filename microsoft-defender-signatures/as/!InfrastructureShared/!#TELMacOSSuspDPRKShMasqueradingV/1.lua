local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1
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
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1)
if L2_1 == nil or L2_1 == "" or L1_1 == nil or L1_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.getfilename
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FULL
L3_1 = L3_1(L4_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L2_1
L4_1 = L2_1.gsub
L6_1 = "%s"
L7_1 = ""
L4_1 = L4_1(L5_1, L6_1, L7_1)
L5_1 = mp
L5_1 = L5_1.get_contextdata
L6_1 = mp
L6_1 = L6_1.CONTEXT_DATA_PROCESS_PPID
L5_1 = L5_1(L6_1)
L6_1 = L1_1
L7_1 = "/"
L8_1 = L2_1
L6_1 = L6_1 .. L7_1 .. L8_1
L7_1 = SuspMacPathsToMonitor
L8_1 = L6_1
L9_1 = true
L7_1 = L7_1(L8_1, L9_1)
if L7_1 then
  L7_1 = {}
  L8_1 = "celastradepro"
  L9_1 = "testspeed"
  L10_1 = "jmttrading"
  L11_1 = "macshare"
  L12_1 = "unioncrypto"
  L13_1 = "coingotrade"
  L14_1 = "3cxdesktop"
  L15_1 = "arialunicode"
  L16_1 = "beavertail"
  L17_1 = "coinbase"
  L18_1 = "pdfviewer"
  L19_1 = "docker"
  L20_1 = "teams"
  L21_1 = "wifianalytics"
  L22_1 = "crossplatformbridges"
  L23_1 = "financialstability"
  L24_1 = "discord"
  L25_1 = "edoneviewer"
  L26_1 = "esilet"
  L27_1 = "hloader"
  L28_1 = "findertools"
  L29_1 = "finderfonts"
  L30_1 = "pdfviewer"
  L31_1 = "cryptocurrency"
  L32_1 = "sugarloader"
  L33_1 = "zoom"
  L34_1 = "jobopportunities"
  L35_1 = "voiceinstallerd"
  L36_1 = "jmttrader"
  L37_1 = "daiwaventures"
  L38_1 = "bizlato"
  L39_1 = "dafom"
  L40_1 = "mirotalk"
  L41_1 = "tokenais"
  L42_1 = "xpcprotect"
  L43_1 = "howardcalendar"
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
  L7_1[32] = L39_1
  L7_1[33] = L40_1
  L7_1[34] = L41_1
  L7_1[35] = L42_1
  L7_1[36] = L43_1
  L8_1 = pairs
  L9_1 = L7_1
  L8_1, L9_1, L10_1 = L8_1(L9_1)
  for L11_1, L12_1 in L8_1, L9_1, L10_1 do
    L13_1 = string
    L13_1 = L13_1.match
    L14_1 = L4_1
    L15_1 = L12_1
    L13_1 = L13_1(L14_1, L15_1)
    if L13_1 then
      L13_1 = mp
      L13_1 = L13_1.set_mpattribute
      L14_1 = "BM_MacDPRKMasquerading"
      L13_1(L14_1)
      if L5_1 then
        L13_1 = MpCommon
        L13_1 = L13_1.BmTriggerSig
        L14_1 = L5_1
        L15_1 = "BM_MacDPRKMasquerading"
        L16_1 = L3_1
        L13_1(L14_1, L15_1, L16_1)
        L13_1 = TrackPidAndTechnique
        L14_1 = L5_1
        L15_1 = "T1036.005"
        L16_1 = "DefenseEvasion_Masquerading_BundleWitPopularName"
        L13_1(L14_1, L15_1, L16_1)
      end
      L13_1 = mp
      L13_1 = L13_1.INFECTED
      return L13_1
    end
    L14_1 = L4_1
    L13_1 = L4_1.gsub
    L15_1 = "%W"
    L16_1 = ""
    L13_1 = L13_1(L14_1, L15_1, L16_1)
    L14_1 = string
    L14_1 = L14_1.match
    L15_1 = L13_1
    L16_1 = L12_1
    L14_1 = L14_1(L15_1, L16_1)
    if L14_1 then
      L14_1 = mp
      L14_1 = L14_1.set_mpattribute
      L15_1 = "BM_MacDPRKMasquerading"
      L14_1(L15_1)
      if L5_1 then
        L14_1 = MpCommon
        L14_1 = L14_1.BmTriggerSig
        L15_1 = L5_1
        L16_1 = "BM_MacDPRKMasquerading"
        L17_1 = L3_1
        L14_1(L15_1, L16_1, L17_1)
        L14_1 = TrackPidAndTechnique
        L15_1 = L5_1
        L16_1 = "T1036.005"
        L17_1 = "DefenseEvasion_Masquerading_BundleWitPopularName"
        L14_1(L15_1, L16_1, L17_1)
      end
      L14_1 = mp
      L14_1 = L14_1.INFECTED
      return L14_1
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
