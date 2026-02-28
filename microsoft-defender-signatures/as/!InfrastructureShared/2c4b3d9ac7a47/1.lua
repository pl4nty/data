local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1
L0_1 = {}
L1_1 = mp
L1_1 = L1_1.SIGATTR_LOG_SZ
L2_1 = {}
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1 = L3_1()
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = MpCommon
L5_1 = L5_1.PathToWin32Path
L6_1 = L3_1
L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1 = L5_1(L6_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1)
L5_1 = StringSplit
L6_1 = L4_1
L7_1 = "\\"
L5_1 = L5_1(L6_1, L7_1)
L6_1 = #L5_1
if 6 <= L6_1 then
  L6_1 = checkFileLastWriteTime
  L7_1 = L4_1
  L8_1 = 120
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 == false then
    L6_1 = {}
    L6_1[".aes"] = true
    L6_1[".amnesia"] = true
    L6_1[".arena"] = true
    L6_1[".artemy"] = true
    L6_1[".avos"] = true
    L6_1[".bianlian"] = true
    L6_1[".bitkangoroo"] = true
    L6_1[".bomber"] = true
    L6_1[".bworm"] = true
    L6_1[".cerber"] = true
    L6_1[".chip"] = true
    L6_1[".clop"] = true
    L6_1[".code"] = true
    L6_1[".conti"] = true
    L6_1[".crab"] = true
    L6_1[".crazy"] = true
    L6_1[".crptd"] = true
    L6_1[".crrrt"] = true
    L6_1[".cry"] = true
    L6_1[".crypt12"] = true
    L6_1[".crypt888"] = true
    L6_1[".crypted"] = true
    L6_1[".cryptolocker"] = true
    L6_1[".darkbit"] = true
    L6_1[".dcrtr"] = true
    L6_1[".defender"] = true
    L6_1[".deria"] = true
    L6_1[".diskdoctor"] = true
    L6_1[".dmr64"] = true
    L6_1[".dng"] = true
    L6_1[".enc"] = true
    L6_1[".encry"] = true
    L6_1[".encrypted"] = true
    L6_1[".exo"] = true
    L6_1[".fargo"] = true
    L6_1[".files-frozen-need-to-make-payment-for-decryptor-or-all-your-files-will-be-permanenlty-deleted"] = true
    L6_1[".flyper"] = true
    L6_1[".frog"] = true
    L6_1[".frs"] = true
    L6_1[".ftcode"] = true
    L6_1[".fun"] = true
    L6_1[".garrantydecrypt"] = true
    L6_1[".gdcb"] = true
    L6_1[".ghost"] = true
    L6_1[".godra"] = true
    L6_1[".gollum"] = true
    L6_1[".hainhc"] = true
    L6_1[".hcked"] = true
    L6_1[".herbst"] = true
    L6_1[".hilda!"] = true
    L6_1[".horros"] = true
    L6_1[".ipygh"] = true
    L6_1[".jaff"] = true
    L6_1[".james"] = true
    L6_1[".jkhnhu"] = true
    L6_1[".jnec"] = true
    L6_1[".josep"] = true
    L6_1[".killrabbit"] = true
    L6_1[".king_ouroboros"] = true
    L6_1[".litra"] = true
    L6_1[".lockbit"] = true
    L6_1[".locked"] = true
    L6_1[".locked-"] = true
    L6_1[".lockify"] = true
    L6_1[".locky"] = true
    L6_1[".losers"] = true
    L6_1[".lotr"] = true
    L6_1[".mamo434376"] = true
    L6_1[".matrix"] = true
    L6_1[".nm4"] = true
    L6_1[".nsmf"] = true
    L6_1[".obfuscated"] = true
    L6_1[".ohno!"] = true
    L6_1[".oops"] = true
    L6_1[".osiris"] = true
    L6_1[".oxr"] = true
    L6_1[".pewcrypt"] = true
    L6_1[".phobos"] = true
    L6_1[".protected"] = true
    L6_1[".qtyu8vh5wdxf6oswam5nua==obck"] = true
    L6_1[".ryk"] = true
    L6_1[".sad"] = true
    L6_1[".sage"] = true
    L6_1[".salsa222"] = true
    L6_1[".satan"] = true
    L6_1[".saturn"] = true
    L6_1[".satyr"] = true
    L6_1[".sb_locked"] = true
    L6_1[".se"] = true
    L6_1[".shrug"] = true
    L6_1[".shutupanddance"] = true
    L6_1[".skystars"] = true
    L6_1[".sykffle"] = true
    L6_1[".sysdown"] = true
    L6_1[".thanatos"] = true
    L6_1[".tron"] = true
    L6_1[".via"] = true
    L6_1[".waffle"] = true
    L6_1[".wamarlocked"] = true
    L6_1[".wasted"] = true
    L6_1[".whycry"] = true
    L6_1[".wndie"] = true
    L6_1[".wsmile"] = true
    L6_1[".xcri"] = true
    L6_1[".xf4g-vbrt-3v78"] = true
    L6_1[".xort"] = true
    L6_1[".yc5pdbhp"] = true
    L6_1[".zorro"] = true
    L7_1 = {}
    L7_1[".[cho.dambler@yandex.com]"] = true
    L7_1[".[jackie7@asia.com]"] = true
    L7_1[".mailto[sevenoneone@cock.li].b6d27"] = true
    L7_1[".trevinomason1@mail.com.vsunit"] = true
    L8_1 = 1
    L9_1 = L1_1
    L10_1 = 1
    for L11_1 = L8_1, L9_1, L10_1 do
      L12_1 = sigattr_tail
      L12_1 = L12_1[L11_1]
      L12_1 = L12_1.attribute
      if L12_1 == 16384 then
        L12_1 = sigattr_tail
        L12_1 = L12_1[L11_1]
        L12_1 = L12_1.utf8p1
        L13_1 = L12_1
        L12_1 = L12_1.byte
        L14_1 = 1
        L12_1 = L12_1(L13_1, L14_1)
        if L12_1 ~= 37 then
          L12_1 = sigattr_tail
          L12_1 = L12_1[L11_1]
          L12_1 = L12_1.utf8p1
          L13_1 = L12_1
          L12_1 = L12_1.lower
          L12_1 = L12_1(L13_1)
          L14_1 = L12_1
          L13_1 = L12_1.match
          L15_1 = "[^\\]+$"
          L13_1 = L13_1(L14_1, L15_1)
          L15_1 = L13_1
          L14_1 = L13_1.gsub
          L16_1 = "%."
          L17_1 = "."
          L14_1, L15_1 = L14_1(L15_1, L16_1, L17_1)
          if 2 <= L15_1 then
            L16_1 = L0_1[L12_1]
            if L16_1 == nil then
              L0_1[L12_1] = L11_1
              L17_1 = L13_1
              L16_1 = L13_1.match
              L18_1 = "^(.+)%.(.+)$"
              L16_1, L17_1 = L16_1(L17_1, L18_1)
              L18_1 = isnull
              L19_1 = L17_1
              L18_1 = L18_1(L19_1)
              if not L18_1 then
                L18_1 = "."
                L19_1 = L17_1
                L17_1 = L18_1 .. L19_1
                L18_1 = false
                L19_1 = L6_1[L17_1]
                if L19_1 == true then
                  L18_1 = true
                else
                  L19_1 = pairs
                  L20_1 = L7_1
                  L19_1, L20_1, L21_1 = L19_1(L20_1)
                  for L22_1, L23_1 in L19_1, L20_1, L21_1 do
                    L24_1 = string
                    L24_1 = L24_1.find
                    L25_1 = L13_1
                    L26_1 = L22_1
                    L27_1 = 1
                    L28_1 = true
                    L24_1 = L24_1(L25_1, L26_1, L27_1, L28_1)
                    if L24_1 then
                      L17_1 = L22_1
                      L18_1 = true
                      break
                    end
                  end
                end
                if L18_1 == true then
                  L19_1 = L2_1[L17_1]
                  if L19_1 ~= nil then
                    L19_1 = table
                    L19_1 = L19_1.insert
                    L20_1 = L2_1[L17_1]
                    L21_1 = L11_1
                    L19_1(L20_1, L21_1)
                  else
                    L19_1 = {}
                    L20_1 = L11_1
                    L19_1[1] = L20_1
                    L2_1[L17_1] = L19_1
                  end
                  L19_1 = L2_1[L17_1]
                  L19_1 = #L19_1
                  if 3 <= L19_1 then
                    L19_1 = {}
                    L20_1 = {}
                    L21_1 = bm
                    L21_1 = L21_1.get_imagepath
                    L21_1 = L21_1()
                    L22_1 = isnull
                    L23_1 = L21_1
                    L22_1 = L22_1(L23_1)
                    if L22_1 then
                      L21_1 = "NA"
                    else
                      L23_1 = L21_1
                      L22_1 = L21_1.lower
                      L22_1 = L22_1(L23_1)
                      L21_1 = L22_1
                    end
                    L22_1 = bm
                    L22_1 = L22_1.get_current_process_startup_info
                    L22_1 = L22_1()
                    if L22_1 ~= nil then
                      L22_1 = L22_1.ppid
                    else
                      L22_1 = "NA"
                    end
                    L23_1 = pairs
                    L24_1 = L2_1[L17_1]
                    L23_1, L24_1, L25_1 = L23_1(L24_1)
                    for L26_1, L27_1 in L23_1, L24_1, L25_1 do
                      L28_1 = ipairs
                      L29_1 = split
                      L30_1 = L27_1
                      L31_1 = "||"
                      L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1 = L29_1(L30_1, L31_1)
                      L28_1, L29_1, L30_1 = L28_1(L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1)
                      for L31_1, L32_1 in L28_1, L29_1, L30_1 do
                        L33_1 = table
                        L33_1 = L33_1.insert
                        L34_1 = L20_1
                        L35_1 = sigattr_tail
                        L36_1 = tonumber
                        L37_1 = L32_1
                        L36_1 = L36_1(L37_1)
                        L35_1 = L35_1[L36_1]
                        L35_1 = L35_1.utf8p1
                        L33_1(L34_1, L35_1)
                      end
                    end
                    L19_1.file_list = L20_1
                    L19_1.cur_image_path = L21_1
                    L19_1.proc_info = L22_1
                    L19_1.appended_ext = L17_1
                    L19_1.magic_mismatch = false
                    L23_1 = bm
                    L23_1 = L23_1.get_sig_count
                    L23_1 = L23_1()
                    L19_1.sig_count = L23_1
                    L23_1 = safeJsonSerialize
                    L24_1 = L19_1
                    L23_1 = L23_1(L24_1)
                    L24_1 = bm
                    L24_1 = L24_1.add_related_string
                    L25_1 = "gensbsim_ransom_meta"
                    L26_1 = L23_1
                    L27_1 = bm
                    L27_1 = L27_1.RelatedStringBMReport
                    L24_1(L25_1, L26_1, L27_1)
                    L24_1 = reportGenericRansomware
                    L25_1 = L23_1
                    L26_1 = true
                    L24_1(L25_1, L26_1)
                    L24_1 = mp
                    L24_1 = L24_1.INFECTED
                    return L24_1
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
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
