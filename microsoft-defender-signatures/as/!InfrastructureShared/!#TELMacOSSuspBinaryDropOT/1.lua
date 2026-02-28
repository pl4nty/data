local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1
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
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1 = L3_1(L4_1, L5_1)
L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1)
if L3_1 == nil or L3_1 == "" or L2_1 == nil or L2_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_PROCESS_PPID
L4_1 = L4_1(L5_1)
L5_1 = L2_1
L6_1 = "/"
L7_1 = L3_1
L5_1 = L5_1 .. L6_1 .. L7_1
L6_1 = string
L6_1 = L6_1.find
L7_1 = L2_1
L8_1 = "/private/tmp"
L9_1 = 1
L10_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 ~= 1 then
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L2_1
  L8_1 = "/private/var"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 ~= 1 then
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L2_1
    L8_1 = "/private/etc"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if L6_1 ~= 1 then
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L2_1
      L8_1 = "/library"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if L6_1 ~= 1 then
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L2_1
        L8_1 = "/users/"
        L9_1 = 1
        L10_1 = true
        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
        if L6_1 ~= 1 then
          L6_1 = string
          L6_1 = L6_1.find
          L7_1 = L2_1
          L8_1 = "/volumes/"
          L9_1 = 1
          L10_1 = true
          L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
          if L6_1 ~= 1 then
            L6_1 = string
            L6_1 = L6_1.find
            L7_1 = L2_1
            L8_1 = "/usr/local"
            L9_1 = 1
            L10_1 = true
            L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
            if L6_1 ~= 1 then
              goto lbl_246
            end
          end
        end
      end
    end
  end
end
L6_1 = {}
L7_1 = "visualstudio"
L8_1 = "adobe"
L9_1 = "flash"
L10_1 = "update"
L11_1 = "celastradepro"
L12_1 = "jobinfo"
L13_1 = "chrome"
L14_1 = "pdf"
L15_1 = "discord"
L16_1 = "word"
L17_1 = "excel"
L18_1 = "onenote"
L19_1 = "edge"
L20_1 = "outlook"
L21_1 = "powerpoint"
L22_1 = "teams"
L23_1 = "remote"
L24_1 = "calendar"
L25_1 = "calculator"
L26_1 = "itunes"
L27_1 = "imovie"
L28_1 = "facetime"
L29_1 = "launchpad"
L30_1 = "maps"
L31_1 = "numbers"
L32_1 = "ondrive"
L33_1 = "reminder"
L34_1 = "safari"
L35_1 = "mail"
L36_1 = "photos"
L37_1 = "time machine"
L38_1 = "desktop"
L39_1 = "magnet"
L40_1 = "alfred"
L41_1 = "pdf expert"
L42_1 = "disk drill"
L43_1 = "cleverfile"
L44_1 = "miner"
L45_1 = "telegram"
L46_1 = "teamspeak"
L47_1 = "element"
L48_1 = "mumble"
L49_1 = "guilded"
L50_1 = "apple"
L51_1 = "mozilla"
L52_1 = "firefox"
L53_1 = "oracle"
L54_1 = "xpcservice"
L55_1 = "microsoft"
L56_1 = "launch"
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
L6_1[14] = L20_1
L6_1[15] = L21_1
L6_1[16] = L22_1
L6_1[17] = L23_1
L6_1[18] = L24_1
L6_1[19] = L25_1
L6_1[20] = L26_1
L6_1[21] = L27_1
L6_1[22] = L28_1
L6_1[23] = L29_1
L6_1[24] = L30_1
L6_1[25] = L31_1
L6_1[26] = L32_1
L6_1[27] = L33_1
L6_1[28] = L34_1
L6_1[29] = L35_1
L6_1[30] = L36_1
L6_1[31] = L37_1
L6_1[32] = L38_1
L6_1[33] = L39_1
L6_1[34] = L40_1
L6_1[35] = L41_1
L6_1[36] = L42_1
L6_1[37] = L43_1
L6_1[38] = L44_1
L6_1[39] = L45_1
L6_1[40] = L46_1
L6_1[41] = L47_1
L6_1[42] = L48_1
L6_1[43] = L49_1
L6_1[44] = L50_1
L6_1[45] = L51_1
L6_1[46] = L52_1
L6_1[47] = L53_1
L6_1[48] = L54_1
L6_1[49] = L55_1
L6_1[50] = L56_1
L7_1 = "zoom"
L8_1 = "copilot"
L9_1 = "google meet"
L10_1 = "coscreen"
L11_1 = "gitsi"
L12_1 = "goto"
L13_1 = "webex"
L6_1[51] = L7_1
L6_1[52] = L8_1
L6_1[53] = L9_1
L6_1[54] = L10_1
L6_1[55] = L11_1
L6_1[56] = L12_1
L6_1[57] = L13_1
L7_1 = pairs
L8_1 = L6_1
L7_1, L8_1, L9_1 = L7_1(L8_1)
for L10_1, L11_1 in L7_1, L8_1, L9_1 do
  L12_1 = string
  L12_1 = L12_1.match
  L13_1 = L3_1
  L14_1 = L11_1
  L12_1 = L12_1(L13_1, L14_1)
  if L12_1 then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = "BM_MacBinaryMasquerading"
    L12_1(L13_1)
    if L4_1 then
      L12_1 = MpCommon
      L12_1 = L12_1.BmTriggerSig
      L13_1 = L4_1
      L14_1 = "BM_MacBinaryMasquerading"
      L15_1 = L5_1
      L12_1(L13_1, L14_1, L15_1)
      L12_1 = TrackPidAndTechnique
      L13_1 = L4_1
      L14_1 = "T1036.005"
      L15_1 = "DefenseEvasion_Masquerading_ExecWitPopularName"
      L12_1(L13_1, L14_1, L15_1)
    end
    L12_1 = mp
    L12_1 = L12_1.INFECTED
    return L12_1
  end
  L13_1 = L3_1
  L12_1 = L3_1.gsub
  L14_1 = "%W"
  L15_1 = ""
  L12_1 = L12_1(L13_1, L14_1, L15_1)
  L13_1 = string
  L13_1 = L13_1.match
  L14_1 = L12_1
  L15_1 = L11_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 then
    L13_1 = mp
    L13_1 = L13_1.set_mpattribute
    L14_1 = "BM_MacBinaryMasquerading"
    L13_1(L14_1)
    if L4_1 then
      L13_1 = MpCommon
      L13_1 = L13_1.BmTriggerSig
      L14_1 = L4_1
      L15_1 = "BM_MacBinaryMasquerading"
      L16_1 = L5_1
      L13_1(L14_1, L15_1, L16_1)
      L13_1 = TrackPidAndTechnique
      L14_1 = L4_1
      L15_1 = "T1036.005"
      L16_1 = "DefenseEvasion_Masquerading_ExecWitPopularName"
      L13_1(L14_1, L15_1, L16_1)
    end
    L13_1 = mp
    L13_1 = L13_1.INFECTED
    return L13_1
  end
end
::lbl_246::
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
