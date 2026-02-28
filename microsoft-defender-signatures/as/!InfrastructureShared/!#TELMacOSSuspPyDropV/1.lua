local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1
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
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1)
if L2_1 == nil or L2_1 == "" or L1_1 == nil or L1_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_PROCESS_PPID
L3_1 = L3_1(L4_1)
L4_1 = L1_1
L5_1 = "/"
L6_1 = L2_1
L4_1 = L4_1 .. L5_1 .. L6_1
L5_1 = string
L5_1 = L5_1.find
L6_1 = L1_1
L7_1 = "/private/tmp"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= 1 then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L1_1
  L7_1 = "/private/var"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= 1 then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L1_1
    L7_1 = "/private/etc"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if L5_1 ~= 1 then
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L1_1
      L7_1 = "/library"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 ~= 1 then
        L5_1 = string
        L5_1 = L5_1.find
        L6_1 = L1_1
        L7_1 = "/users/"
        L8_1 = 1
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if L5_1 ~= 1 then
          L5_1 = string
          L5_1 = L5_1.find
          L6_1 = L1_1
          L7_1 = "/volumes/"
          L8_1 = 1
          L9_1 = true
          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
          if L5_1 ~= 1 then
            L5_1 = string
            L5_1 = L5_1.find
            L6_1 = L1_1
            L7_1 = "/usr/local"
            L8_1 = 1
            L9_1 = true
            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
            if L5_1 ~= 1 then
              goto lbl_236
            end
          end
        end
      end
    end
  end
end
L5_1 = {}
L6_1 = "visualstudio"
L7_1 = "adobe"
L8_1 = "flash"
L9_1 = "update"
L10_1 = "patch"
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
L5_1[30] = L35_1
L5_1[31] = L36_1
L5_1[32] = L37_1
L5_1[33] = L38_1
L5_1[34] = L39_1
L5_1[35] = L40_1
L5_1[36] = L41_1
L5_1[37] = L42_1
L5_1[38] = L43_1
L5_1[39] = L44_1
L5_1[40] = L45_1
L5_1[41] = L46_1
L5_1[42] = L47_1
L5_1[43] = L48_1
L5_1[44] = L49_1
L5_1[45] = L50_1
L5_1[46] = L51_1
L5_1[47] = L52_1
L5_1[48] = L53_1
L5_1[49] = L54_1
L5_1[50] = L55_1
L6_1 = "launch"
L7_1 = "zoom"
L8_1 = "copilot"
L9_1 = "google meet"
L10_1 = "coscreen"
L11_1 = "gitsi"
L12_1 = "goto"
L13_1 = "webex"
L5_1[51] = L6_1
L5_1[52] = L7_1
L5_1[53] = L8_1
L5_1[54] = L9_1
L5_1[55] = L10_1
L5_1[56] = L11_1
L5_1[57] = L12_1
L5_1[58] = L13_1
L6_1 = pairs
L7_1 = L5_1
L6_1, L7_1, L8_1 = L6_1(L7_1)
for L9_1, L10_1 in L6_1, L7_1, L8_1 do
  L11_1 = string
  L11_1 = L11_1.match
  L12_1 = L2_1
  L13_1 = L10_1
  L11_1 = L11_1(L12_1, L13_1)
  if L11_1 then
    L11_1 = mp
    L11_1 = L11_1.set_mpattribute
    L12_1 = "BM_MacPyMasquerading"
    L11_1(L12_1)
    if L3_1 then
      L11_1 = MpCommon
      L11_1 = L11_1.BmTriggerSig
      L12_1 = L3_1
      L13_1 = "BM_MacPyMasquerading"
      L14_1 = L4_1
      L11_1(L12_1, L13_1, L14_1)
      L11_1 = TrackPidAndTechnique
      L12_1 = L3_1
      L13_1 = "T1036.005"
      L14_1 = "DefenseEvasion_Masquerading_ExecWitPopularName"
      L11_1(L12_1, L13_1, L14_1)
    end
    L11_1 = mp
    L11_1 = L11_1.INFECTED
    return L11_1
  end
  L12_1 = L2_1
  L11_1 = L2_1.gsub
  L13_1 = "%W"
  L14_1 = ""
  L11_1 = L11_1(L12_1, L13_1, L14_1)
  L12_1 = string
  L12_1 = L12_1.match
  L13_1 = L11_1
  L14_1 = L10_1
  L12_1 = L12_1(L13_1, L14_1)
  if L12_1 then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = "BM_MacPyMasquerading"
    L12_1(L13_1)
    if L3_1 then
      L12_1 = MpCommon
      L12_1 = L12_1.BmTriggerSig
      L13_1 = L3_1
      L14_1 = "BM_MacPyMasquerading"
      L15_1 = L4_1
      L12_1(L13_1, L14_1, L15_1)
      L12_1 = TrackPidAndTechnique
      L13_1 = L3_1
      L14_1 = "T1036.005"
      L15_1 = "DefenseEvasion_Masquerading_ExecWitPopularName"
      L12_1(L13_1, L14_1, L15_1)
    end
    L12_1 = mp
    L12_1 = L12_1.INFECTED
    return L12_1
  end
end
::lbl_236::
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
