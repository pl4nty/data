local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1
L0_1 = {}
L1_1 = 0
L2_1 = {}
L3_1 = 0
L4_1 = mp
L4_1 = L4_1.SIGATTR_LOG_SZ
L5_1 = {}
L6_1 = bm
L6_1 = L6_1.get_imagepath
L6_1 = L6_1()
if L6_1 == nil then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = string
L7_1 = L7_1.lower
L8_1 = MpCommon
L8_1 = L8_1.PathToWin32Path
L9_1 = L6_1
L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1 = L8_1(L9_1)
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1)
L8_1 = StringSplit
L9_1 = L7_1
L10_1 = "\\"
L8_1 = L8_1(L9_1, L10_1)
L9_1 = #L8_1
if 7 < L9_1 then
  L9_1 = checkFileLastWriteTime
  L10_1 = L7_1
  L11_1 = 120
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 == false then
    L9_1 = 1
    L10_1 = L4_1
    L11_1 = 1
    for L12_1 = L9_1, L10_1, L11_1 do
      L13_1 = sigattr_tail
      L13_1 = L13_1[L12_1]
      L13_1 = L13_1.attribute
      if L13_1 == 16384 then
        L13_1 = sigattr_tail
        L13_1 = L13_1[L12_1]
        L13_1 = L13_1.utf8p1
        L14_1 = L13_1
        L13_1 = L13_1.byte
        L15_1 = 1
        L13_1 = L13_1(L14_1, L15_1)
        if L13_1 ~= 37 then
          L13_1 = sigattr_tail
          L13_1 = L13_1[L12_1]
          L13_1 = L13_1.utf8p1
          L14_1 = L13_1
          L13_1 = L13_1.lower
          L13_1 = L13_1(L14_1)
          L15_1 = L13_1
          L14_1 = L13_1.match
          L16_1 = "%.[^%.]+$"
          L14_1 = L14_1(L15_1, L16_1)
          if L14_1 ~= nil then
            L15_1 = mp
            L15_1 = L15_1.GetExtensionClass
            L16_1 = L14_1
            L15_1 = L15_1(L16_1)
            if L15_1 ~= 4 then
              L17_1 = L13_1
              L16_1 = L13_1.match
              L18_1 = "[^\\]+$"
              L16_1 = L16_1(L17_1, L18_1)
              L18_1 = L16_1
              L17_1 = L16_1.gsub
              L19_1 = "%."
              L20_1 = "."
              L17_1, L18_1 = L17_1(L18_1, L19_1, L20_1)
              if L15_1 == 0 and 2 <= L18_1 then
                L19_1 = L0_1[L13_1]
                if L19_1 == nil then
                  L0_1[L13_1] = L12_1
                  L1_1 = L1_1 + 1
              end
              elseif L18_1 == 1 then
                L19_1 = L2_1[L13_1]
                if L19_1 == nil then
                  L2_1[L13_1] = L12_1
                  L3_1 = L3_1 + 1
                end
              end
            end
          end
        end
      end
    end
    L9_1 = {}
    L9_1[".aes"] = true
    L9_1[".amnesia"] = true
    L9_1[".arena"] = true
    L9_1[".artemy"] = true
    L9_1[".bitkangoroo"] = true
    L9_1[".bomber"] = true
    L9_1[".bworm"] = true
    L9_1[".cerber"] = true
    L9_1[".chip"] = true
    L9_1[".clop"] = true
    L9_1[".code"] = true
    L9_1[".crab"] = true
    L9_1[".crazy"] = true
    L9_1[".crrrt"] = true
    L9_1[".cry"] = true
    L9_1[".crypt12"] = true
    L9_1[".crypt888"] = true
    L9_1[".crypted"] = true
    L9_1[".cryptolocker"] = true
    L9_1[".dcrtr"] = true
    L9_1[".defender"] = true
    L9_1[".deria"] = true
    L9_1[".diskdoctor"] = true
    L9_1[".dmr64"] = true
    L9_1[".dng"] = true
    L9_1[".enc"] = true
    L9_1[".encry"] = true
    L9_1[".encrypted"] = true
    L9_1[".exo"] = true
    L9_1[".files-frozen-need-to-make-payment-for-decryptor-or-all-your-files-will-be-permanenlty-deleted"] = true
    L9_1[".flyper"] = true
    L9_1[".frog"] = true
    L9_1[".frs"] = true
    L9_1[".ftcode"] = true
    L9_1[".fun"] = true
    L9_1[".garrantydecrypt"] = true
    L9_1[".ghost"] = true
    L9_1[".godra"] = true
    L9_1[".gollum"] = true
    L9_1[".hainhc"] = true
    L9_1[".havoccrypt"] = true
    L9_1[".hcked"] = true
    L9_1[".hilda!"] = true
    L9_1[".horros"] = true
    L9_1[".ipygh"] = true
    L9_1[".jaff"] = true
    L9_1[".james"] = true
    L9_1[".jkhnhu"] = true
    L9_1[".jnec"] = true
    L9_1[".josep"] = true
    L9_1[".killrabbit"] = true
    L9_1[".litra"] = true
    L9_1[".locked"] = true
    L9_1[".locked-"] = true
    L9_1[".lockify"] = true
    L9_1[".locky"] = true
    L9_1[".losers"] = true
    L9_1[".lotr"] = true
    L9_1[".mailto[sevenoneone@cock.li].b6d27"] = true
    L9_1[".mamo434376"] = true
    L9_1[".matrix"] = true
    L9_1[".nm4"] = true
    L9_1[".nsmf"] = true
    L9_1[".obfuscated"] = true
    L9_1[".ohno!"] = true
    L9_1[".oops"] = true
    L9_1[".osiris"] = true
    L9_1[".oxr"] = true
    L9_1[".pewcrypt"] = true
    L9_1[".phobos"] = true
    L9_1[".protected"] = true
    L9_1[".qtyu8vh5wdxf6oswam5nua==obck"] = true
    L9_1[".ryk"] = true
    L9_1[".sad"] = true
    L9_1[".sage"] = true
    L9_1[".salsa222"] = true
    L9_1[".satan"] = true
    L9_1[".saturn"] = true
    L9_1[".satyr"] = true
    L9_1[".se"] = true
    L9_1[".shrug"] = true
    L9_1[".shutupanddance"] = true
    L9_1[".skystars"] = true
    L9_1[".sysdown"] = true
    L9_1[".thanatos"] = true
    L9_1[".trevinomason1@mail.com.vsunit"] = true
    L9_1[".tron"] = true
    L9_1[".via"] = true
    L9_1[".waffle"] = true
    L9_1[".wamarlocked"] = true
    L9_1[".whycry"] = true
    L9_1[".wndie"] = true
    L9_1[".wsmile"] = true
    L9_1[".xcri"] = true
    L9_1[".xf4g-vbrt-3v78"] = true
    L9_1[".xort"] = true
    L9_1[".yc5pdbhp"] = true
    L9_1[".zorro"] = true
    L9_1[".[cho.dambler@yandex.com]"] = true
    L9_1[".[jackie7@asia.com]"] = true
    if 4 <= L1_1 and 4 <= L3_1 then
      L10_1 = pairs
      L11_1 = L0_1
      L10_1, L11_1, L12_1 = L10_1(L11_1)
      for L13_1, L14_1 in L10_1, L11_1, L12_1 do
        L16_1 = L13_1
        L15_1 = L13_1.match
        L17_1 = "^(.+)%.(.+)$"
        L15_1, L16_1 = L15_1(L16_1, L17_1)
        L17_1 = "."
        L18_1 = L16_1
        L16_1 = L17_1 .. L18_1
        L17_1 = isnull
        L18_1 = L15_1
        L17_1 = L17_1(L18_1)
        if not L17_1 then
          L17_1 = L9_1[L16_1]
          if L17_1 == true then
            L17_1 = L2_1[L15_1]
            L18_1 = isnull
            L19_1 = L17_1
            L18_1 = L18_1(L19_1)
            if not L18_1 then
              L18_1 = L5_1[L16_1]
              if L18_1 ~= nil then
                L18_1 = table
                L18_1 = L18_1.insert
                L19_1 = L5_1[L16_1]
                L20_1 = tostring
                L21_1 = L17_1
                L20_1 = L20_1(L21_1)
                L21_1 = "||"
                L22_1 = tostring
                L23_1 = L14_1
                L22_1 = L22_1(L23_1)
                L20_1 = L20_1 .. L21_1 .. L22_1
                L18_1(L19_1, L20_1)
              else
                L18_1 = {}
                L19_1 = tostring
                L20_1 = L17_1
                L19_1 = L19_1(L20_1)
                L20_1 = "||"
                L21_1 = tostring
                L22_1 = L14_1
                L21_1 = L21_1(L22_1)
                L19_1 = L19_1 .. L20_1 .. L21_1
                L18_1[1] = L19_1
                L5_1[L16_1] = L18_1
              end
              L18_1 = L5_1[L16_1]
              L18_1 = #L18_1
              if 4 <= L18_1 then
                L18_1 = {}
                L19_1 = {}
                L20_1 = bm
                L20_1 = L20_1.get_imagepath
                L20_1 = L20_1()
                L21_1 = isnull
                L22_1 = L20_1
                L21_1 = L21_1(L22_1)
                if L21_1 then
                  L20_1 = "NA"
                else
                  L22_1 = L20_1
                  L21_1 = L20_1.lower
                  L21_1 = L21_1(L22_1)
                  L20_1 = L21_1
                end
                L21_1 = bm
                L21_1 = L21_1.get_current_process_startup_info
                L21_1 = L21_1()
                if L21_1 ~= nil then
                  L21_1 = L21_1.ppid
                else
                  L21_1 = "NA"
                end
                L22_1 = pairs
                L23_1 = L5_1[L16_1]
                L22_1, L23_1, L24_1 = L22_1(L23_1)
                for L25_1, L26_1 in L22_1, L23_1, L24_1 do
                  L27_1 = ipairs
                  L28_1 = split
                  L29_1 = L26_1
                  L30_1 = "||"
                  L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1 = L28_1(L29_1, L30_1)
                  L27_1, L28_1, L29_1 = L27_1(L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1)
                  for L30_1, L31_1 in L27_1, L28_1, L29_1 do
                    L32_1 = table
                    L32_1 = L32_1.insert
                    L33_1 = L19_1
                    L34_1 = sigattr_tail
                    L35_1 = tonumber
                    L36_1 = L31_1
                    L35_1 = L35_1(L36_1)
                    L34_1 = L34_1[L35_1]
                    L34_1 = L34_1.utf8p1
                    L32_1(L33_1, L34_1)
                  end
                end
                L18_1.file_list = L19_1
                L18_1.cur_image_path = L20_1
                L18_1.proc_info = L21_1
                L18_1.appended_ext = L16_1
                L18_1.magic_mismatch = false
                L22_1 = bm
                L22_1 = L22_1.get_sig_count
                L22_1 = L22_1()
                L18_1.sig_count = L22_1
                L22_1 = safeJsonSerialize
                L23_1 = L18_1
                L22_1 = L22_1(L23_1)
                L23_1 = bm
                L23_1 = L23_1.add_related_string
                L24_1 = "gensbsim_ransom_meta"
                L25_1 = L22_1
                L26_1 = bm
                L26_1 = L26_1.RelatedStringBMReport
                L23_1(L24_1, L25_1, L26_1)
                L23_1 = reportGenericRansomware
                L24_1 = L22_1
                L25_1 = true
                L23_1(L24_1, L25_1)
                L23_1 = mp
                L23_1 = L23_1.INFECTED
                return L23_1
              end
            end
          end
        end
      end
    end
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
