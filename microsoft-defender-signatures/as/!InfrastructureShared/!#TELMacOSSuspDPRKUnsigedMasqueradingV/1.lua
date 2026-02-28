local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1
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
L1_1 = L1_1.GetCertificateInfo
L1_1 = L1_1()
L2_1 = #L1_1
if 0 < L2_1 and L1_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.bitor
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_FNAME
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_PATH
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1 = L3_1(L4_1, L5_1)
L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1)
if L3_1 == nil or L3_1 == "" or L2_1 == nil or L2_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "->(macho-unibin-"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 then
  L5_1 = L3_1
  L4_1 = L3_1.gsub
  L6_1 = "%->%(macho%-unibin%-.*"
  L7_1 = ""
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  L3_1 = L4_1
end
L5_1 = L3_1
L4_1 = L3_1.gsub
L6_1 = "%s"
L7_1 = ""
L4_1 = L4_1(L5_1, L6_1, L7_1)
L5_1 = mp
L5_1 = L5_1.get_contextdata
L6_1 = mp
L6_1 = L6_1.CONTEXT_DATA_PROCESS_PPID
L5_1 = L5_1(L6_1)
L6_1 = L2_1
L7_1 = "/"
L8_1 = L3_1
L6_1 = L6_1 .. L7_1 .. L8_1
L7_1 = IsExcludedByImagePathMacOS
L8_1 = L6_1
L7_1 = L7_1(L8_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.getfilename
L8_1 = mp
L8_1 = L8_1.FILEPATH_QUERY_FULL
L7_1 = L7_1(L8_1)
if L7_1 == nil or L7_1 == "" then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = string
L8_1 = L8_1.find
L9_1 = L7_1
L10_1 = "->(MachO-UniBin-"
L11_1 = 1
L12_1 = true
L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
if L8_1 then
  L9_1 = L7_1
  L8_1 = L7_1.gsub
  L10_1 = "%->%(MachO%-UniBin%-.*"
  L11_1 = ""
  L8_1 = L8_1(L9_1, L10_1, L11_1)
  L7_1 = L8_1
end
L8_1 = SuspMacPathsToMonitor
L9_1 = L6_1
L10_1 = true
L8_1 = L8_1(L9_1, L10_1)
if L8_1 then
  L8_1 = {}
  L9_1 = "celastradepro"
  L10_1 = "testspeed"
  L11_1 = "jmttrading"
  L12_1 = "macshare"
  L13_1 = "unioncrypto"
  L14_1 = "coingotrade"
  L15_1 = "3cxdesktop"
  L16_1 = "arialunicode"
  L17_1 = "beavertail"
  L18_1 = "coinbase"
  L19_1 = "pdfviewer"
  L20_1 = "docker"
  L21_1 = "teams"
  L22_1 = "wifianalytics"
  L23_1 = "crossplatformbridges"
  L24_1 = "financialstability"
  L25_1 = "discord"
  L26_1 = "edoneviewer"
  L27_1 = "esilet"
  L28_1 = "hloader"
  L29_1 = "findertools"
  L30_1 = "finderfonts"
  L31_1 = "pdfviewer"
  L32_1 = "cryptocurrency"
  L33_1 = "sugarloader"
  L34_1 = "zoom"
  L35_1 = "jobopportunities"
  L36_1 = "voiceinstallerd"
  L37_1 = "jmttrader"
  L38_1 = "daiwaventures"
  L39_1 = "bizlato"
  L40_1 = "dafom"
  L41_1 = "mirotalk"
  L42_1 = "tokenais"
  L43_1 = "xpcprotect"
  L44_1 = "howardcalendar"
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
  L8_1[16] = L24_1
  L8_1[17] = L25_1
  L8_1[18] = L26_1
  L8_1[19] = L27_1
  L8_1[20] = L28_1
  L8_1[21] = L29_1
  L8_1[22] = L30_1
  L8_1[23] = L31_1
  L8_1[24] = L32_1
  L8_1[25] = L33_1
  L8_1[26] = L34_1
  L8_1[27] = L35_1
  L8_1[28] = L36_1
  L8_1[29] = L37_1
  L8_1[30] = L38_1
  L8_1[31] = L39_1
  L8_1[32] = L40_1
  L8_1[33] = L41_1
  L8_1[34] = L42_1
  L8_1[35] = L43_1
  L8_1[36] = L44_1
  L9_1 = pairs
  L10_1 = L8_1
  L9_1, L10_1, L11_1 = L9_1(L10_1)
  for L12_1, L13_1 in L9_1, L10_1, L11_1 do
    L14_1 = string
    L14_1 = L14_1.match
    L15_1 = L4_1
    L16_1 = L13_1
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
        L17_1 = L7_1
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
    L15_1 = L4_1
    L14_1 = L4_1.gsub
    L16_1 = "%W"
    L17_1 = ""
    L14_1 = L14_1(L15_1, L16_1, L17_1)
    L15_1 = string
    L15_1 = L15_1.match
    L16_1 = L14_1
    L17_1 = L13_1
    L15_1 = L15_1(L16_1, L17_1)
    if L15_1 then
      L15_1 = mp
      L15_1 = L15_1.set_mpattribute
      L16_1 = "BM_MacDPRKMasquerading"
      L15_1(L16_1)
      if L5_1 then
        L15_1 = MpCommon
        L15_1 = L15_1.BmTriggerSig
        L16_1 = L5_1
        L17_1 = "BM_MacDPRKMasquerading"
        L18_1 = L7_1
        L15_1(L16_1, L17_1, L18_1)
        L15_1 = TrackPidAndTechnique
        L16_1 = L5_1
        L17_1 = "T1036.005"
        L18_1 = "DefenseEvasion_Masquerading_BundleWitPopularName"
        L15_1(L16_1, L17_1, L18_1)
      end
      L15_1 = mp
      L15_1 = L15_1.INFECTED
      return L15_1
    end
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
