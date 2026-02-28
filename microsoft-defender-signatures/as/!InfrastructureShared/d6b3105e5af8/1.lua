local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "com.apple.webkit.networking"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if not L3_1 then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "com.apple.safari.sandboxbroker"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L3_1 = IsExcludedByCmdlineMacOS
    L4_1 = L1_1
    L3_1 = L3_1(L4_1)
    if not L3_1 then
      L3_1 = IsExcludedByImagePathMacOS
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      if not L3_1 then
        goto lbl_39
      end
    end
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
::lbl_39::
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[1]
    L3_1 = L4_1.utf8p2
end
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[2]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= nil then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[2]
      L3_1 = L4_1.utf8p2
  end
  else
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.matched
    if L4_1 then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[3]
      L4_1 = L4_1.utf8p2
      if L4_1 ~= nil then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[3]
        L3_1 = L4_1.utf8p2
    end
    else
      L4_1 = this_sigattrlog
      L4_1 = L4_1[4]
      L4_1 = L4_1.matched
      if L4_1 then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[4]
        L4_1 = L4_1.utf8p2
        if L4_1 ~= nil then
          L4_1 = this_sigattrlog
          L4_1 = L4_1[4]
          L3_1 = L4_1.utf8p2
      end
      else
        L4_1 = this_sigattrlog
        L4_1 = L4_1[5]
        L4_1 = L4_1.matched
        if L4_1 then
          L4_1 = this_sigattrlog
          L4_1 = L4_1[5]
          L4_1 = L4_1.utf8p2
          if L4_1 ~= nil then
            L4_1 = this_sigattrlog
            L4_1 = L4_1[5]
            L3_1 = L4_1.utf8p2
        end
        else
          L4_1 = mp
          L4_1 = L4_1.CLEAN
          return L4_1
        end
      end
    end
  end
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = "/bin/"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= 1 then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L4_1
  L7_1 = "/system/"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= 1 then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L4_1
    L7_1 = "/library/apple/"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if L5_1 ~= 1 then
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L4_1
      L7_1 = "/library/installersandboxes/"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 ~= 1 then
        L5_1 = string
        L5_1 = L5_1.find
        L6_1 = L4_1
        L7_1 = "/.git/modules/"
        L8_1 = 1
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if not L5_1 then
          L5_1 = string
          L5_1 = L5_1.find
          L6_1 = L4_1
          L7_1 = "/.git/hooks/"
          L8_1 = 1
          L9_1 = true
          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
          if not L5_1 then
            L5_1 = string
            L5_1 = L5_1.find
            L6_1 = L4_1
            L7_1 = "/sbin/"
            L8_1 = 1
            L9_1 = true
            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
            if L5_1 ~= 1 then
              L5_1 = string
              L5_1 = L5_1.find
              L6_1 = L4_1
              L7_1 = "/private/var/db/com.apple.xpc.roleaccountd.staging"
              L8_1 = 1
              L9_1 = true
              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
              if L5_1 ~= 1 then
                L5_1 = string
                L5_1 = L5_1.find
                L6_1 = L4_1
                L7_1 = "/private/var/folders/"
                L8_1 = 1
                L9_1 = true
                L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                if L5_1 ~= 1 then
                  L5_1 = string
                  L5_1 = L5_1.find
                  L6_1 = L4_1
                  L7_1 = "/usr/"
                  L8_1 = 1
                  L9_1 = true
                  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                  if L5_1 == 1 then
                    L5_1 = string
                    L5_1 = L5_1.find
                    L6_1 = L4_1
                    L7_1 = "/usr/local/"
                    L8_1 = 1
                    L9_1 = true
                    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                    L5_1 = not L5_1
                    if L5_1 == 1 then
                      goto lbl_226
                    end
                  end
                  L5_1 = string
                  L5_1 = L5_1.find
                  L6_1 = L4_1
                  L7_1 = "/applications/microsoft defender.app/"
                  L8_1 = 1
                  L9_1 = true
                  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                  if L5_1 ~= 1 then
                    goto lbl_229
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
::lbl_226::
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_229::
L6_1 = L3_1
L5_1 = L3_1.match
L7_1 = "[^/]*$"
L5_1 = L5_1(L6_1, L7_1)
if L5_1 == nil or L5_1 == "" then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L7_1 = L5_1
L6_1 = L5_1.match
L8_1 = "(.+)%..+"
L6_1 = L6_1(L7_1, L8_1)
if L6_1 == nil or L6_1 == "" then
  L6_1 = L5_1
end
L7_1 = string
L7_1 = L7_1.lower
L8_1 = L6_1
L7_1 = L7_1(L8_1)
L9_1 = L7_1
L8_1 = L7_1.gsub
L10_1 = "%W"
L11_1 = ""
L8_1 = L8_1(L9_1, L10_1, L11_1)
L9_1 = {}
L10_1 = "visualstudio"
L11_1 = "adobe"
L12_1 = "flash"
L13_1 = "update"
L14_1 = "patch"
L15_1 = "celastradepro"
L16_1 = "jobinfo"
L17_1 = "chrome"
L18_1 = "pdf"
L19_1 = "discord"
L20_1 = "word"
L21_1 = "excel"
L22_1 = "onenote"
L23_1 = "edge"
L24_1 = "outlook"
L25_1 = "powerpoint"
L26_1 = "teams"
L27_1 = "remote"
L28_1 = "calendar"
L29_1 = "calculator"
L30_1 = "itunes"
L31_1 = "imovie"
L32_1 = "facetime"
L33_1 = "launchpad"
L34_1 = "maps"
L35_1 = "numbers"
L36_1 = "ondrive"
L37_1 = "reminder"
L38_1 = "safari"
L39_1 = "mail"
L40_1 = "photos"
L41_1 = "time machine"
L42_1 = "desktop"
L43_1 = "magnet"
L44_1 = "alfred"
L45_1 = "pdf expert"
L46_1 = "disk drill"
L47_1 = "cleverfile"
L48_1 = "miner"
L49_1 = "telegram"
L50_1 = "teamspeak"
L51_1 = "element"
L52_1 = "mumble"
L53_1 = "guilded"
L54_1 = "apple"
L55_1 = "mozilla"
L56_1 = "oracle"
L57_1 = "xpcservice"
L58_1 = "microsoft"
L59_1 = "launch"
L9_1[1] = L10_1
L9_1[2] = L11_1
L9_1[3] = L12_1
L9_1[4] = L13_1
L9_1[5] = L14_1
L9_1[6] = L15_1
L9_1[7] = L16_1
L9_1[8] = L17_1
L9_1[9] = L18_1
L9_1[10] = L19_1
L9_1[11] = L20_1
L9_1[12] = L21_1
L9_1[13] = L22_1
L9_1[14] = L23_1
L9_1[15] = L24_1
L9_1[16] = L25_1
L9_1[17] = L26_1
L9_1[18] = L27_1
L9_1[19] = L28_1
L9_1[20] = L29_1
L9_1[21] = L30_1
L9_1[22] = L31_1
L9_1[23] = L32_1
L9_1[24] = L33_1
L9_1[25] = L34_1
L9_1[26] = L35_1
L9_1[27] = L36_1
L9_1[28] = L37_1
L9_1[29] = L38_1
L9_1[30] = L39_1
L9_1[31] = L40_1
L9_1[32] = L41_1
L9_1[33] = L42_1
L9_1[34] = L43_1
L9_1[35] = L44_1
L9_1[36] = L45_1
L9_1[37] = L46_1
L9_1[38] = L47_1
L9_1[39] = L48_1
L9_1[40] = L49_1
L9_1[41] = L50_1
L9_1[42] = L51_1
L9_1[43] = L52_1
L9_1[44] = L53_1
L9_1[45] = L54_1
L9_1[46] = L55_1
L9_1[47] = L56_1
L9_1[48] = L57_1
L9_1[49] = L58_1
L9_1[50] = L59_1
L10_1 = "zoom"
L11_1 = "copilot"
L12_1 = "google meet"
L13_1 = "coscreen"
L14_1 = "gitsi"
L15_1 = "goto"
L16_1 = "webex"
L17_1 = "firefox"
L18_1 = "interview"
L19_1 = "jobdescription"
L9_1[51] = L10_1
L9_1[52] = L11_1
L9_1[53] = L12_1
L9_1[54] = L13_1
L9_1[55] = L14_1
L9_1[56] = L15_1
L9_1[57] = L16_1
L9_1[58] = L17_1
L9_1[59] = L18_1
L9_1[60] = L19_1
L10_1 = pairs
L11_1 = L9_1
L10_1, L11_1, L12_1 = L10_1(L11_1)
for L13_1, L14_1 in L10_1, L11_1, L12_1 do
  if L8_1 == L14_1 then
    L15_1 = mp
    L15_1 = L15_1.INFECTED
    return L15_1
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
