local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = 150000000
L2_1 = bm
L2_1 = L2_1.GetSignatureMatchDuration
L2_1 = L2_1()
if L1_1 < L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1 = L3_1()
L4_1 = L3_1
L3_1 = L3_1.lower
L3_1 = L3_1(L4_1)
if L3_1 ~= nil and L3_1 ~= "" then
  L4_1 = IsExcludedByImagePath
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    goto lbl_30
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_30::
L4_1 = bm
L4_1 = L4_1.get_current_process_startup_info
L4_1 = L4_1()
if L4_1 ~= nil then
  L4_1 = L4_1.ppid
else
  L4_1 = "-1"
end
L5_1 = isParentPackageManager
L6_1 = L4_1
L7_1 = true
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = 1
L6_1 = L0_1
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = sigattr_tail
  L9_1 = L9_1[L8_1]
  L9_1 = L9_1.attribute
  if L9_1 == 16385 then
    L9_1 = sigattr_tail
    L9_1 = L9_1[L8_1]
    L9_1 = L9_1.utf8p1
    L10_1 = L9_1
    L9_1 = L9_1.lower
    L9_1 = L9_1(L10_1)
    L10_1 = mp
    L10_1 = L10_1.crc32
    L11_1 = 0
    L12_1 = L9_1
    L13_1 = 1
    L14_1 = #L9_1
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
    L2_1[L10_1] = 1
  end
end
L5_1 = {}
L6_1 = {}
L7_1 = 1
L8_1 = L0_1
L9_1 = 1
for L10_1 = L7_1, L8_1, L9_1 do
  L11_1 = sigattr_tail
  L11_1 = L11_1[L10_1]
  L11_1 = L11_1.attribute
  if L11_1 == 16386 then
    L11_1 = sigattr_tail
    L11_1 = L11_1[L10_1]
    L11_1 = L11_1.utf8p2
    L12_1 = L11_1
    L11_1 = L11_1.lower
    L11_1 = L11_1(L12_1)
    L12_1 = sigattr_tail
    L12_1 = L12_1[L10_1]
    L12_1 = L12_1.utf8p1
    L13_1 = L12_1
    L12_1 = L12_1.lower
    L12_1 = L12_1(L13_1)
    L13_1 = mp
    L13_1 = L13_1.crc32
    L14_1 = 0
    L15_1 = L11_1
    L16_1 = 1
    L17_1 = #L11_1
    L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
    L14_1 = mp
    L14_1 = L14_1.crc32
    L15_1 = 0
    L16_1 = L12_1
    L17_1 = 1
    L18_1 = #L12_1
    L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
    L15_1 = L2_1[L14_1]
    if L15_1 == nil then
      L15_1 = L2_1[L13_1]
      if L15_1 == nil then
        goto lbl_278
      end
    end
    L15_1 = L6_1[L13_1]
    if L15_1 == nil then
      L16_1 = L11_1
      L15_1 = L11_1.match
      L17_1 = "%.[^/%.]+$"
      L15_1 = L15_1(L16_1, L17_1)
      if L15_1 ~= nil then
        L16_1 = mp
        L16_1 = L16_1.GetExtensionClass
        L17_1 = L15_1
        L16_1 = L16_1(L17_1)
        if L16_1 ~= 3 then
          L16_1 = #L11_1
          L17_1 = #L12_1
          if L16_1 < L17_1 then
            L17_1 = L12_1
            L16_1 = L12_1.find
            L18_1 = L11_1
            L19_1 = 1
            L20_1 = true
            L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
            if L16_1 == 1 then
              L17_1 = L12_1
              L16_1 = L12_1.byte
              L18_1 = #L11_1
              L18_1 = L18_1 + 1
              L16_1 = L16_1(L17_1, L18_1)
              if L16_1 == 46 then
                L17_1 = L12_1
                L16_1 = L12_1.byte
                L18_1 = #L11_1
                L18_1 = L18_1 + 1
                L16_1 = L16_1(L17_1, L18_1)
                if L16_1 ~= 58 then
                  L6_1[L13_1] = 1
                  L17_1 = L12_1
                  L16_1 = L12_1.match
                  L18_1 = "%.[^/%.]+$"
                  L16_1 = L16_1(L17_1, L18_1)
                  if L16_1 ~= nil then
                    L17_1 = mp
                    L17_1 = L17_1.GetExtensionClass
                    L18_1 = L16_1
                    L17_1 = L17_1(L18_1)
                    if L17_1 ~= 4 then
                      L17_1 = IsExcludedByImagePathFileExtension
                      L18_1 = L3_1
                      L19_1 = L16_1
                      L17_1 = L17_1(L18_1, L19_1)
                      if L17_1 == false then
                        L17_1 = IsExcludedByImagePathFileExtensionRegEx
                        L18_1 = L3_1
                        L19_1 = L16_1
                        L17_1 = L17_1(L18_1, L19_1)
                        if L17_1 == false then
                          L17_1 = IsExcludedByImagePathFileExtensionSuffix
                          L18_1 = L3_1
                          L19_1 = L16_1
                          L17_1 = L17_1(L18_1, L19_1)
                          if L17_1 == false then
                            L17_1 = IsExtensionDatePattern
                            L18_1 = L16_1
                            L17_1 = L17_1(L18_1)
                            if L17_1 == false then
                              L17_1 = string
                              L17_1 = L17_1.sub
                              L18_1 = L12_1
                              L19_1 = #L11_1
                              L19_1 = L19_1 + 1
                              L17_1 = L17_1(L18_1, L19_1)
                              L18_1 = L5_1[L17_1]
                              if L18_1 ~= nil then
                                L18_1 = table
                                L18_1 = L18_1.insert
                                L19_1 = L5_1[L17_1]
                                L20_1 = L10_1
                                L18_1(L19_1, L20_1)
                                L18_1 = L5_1[L17_1]
                                L18_1 = #L18_1
                                if 10 <= L18_1 then
                                  L18_1 = bm
                                  L18_1 = L18_1.add_related_string
                                  L19_1 = "ransom_extension"
                                  L20_1 = L17_1
                                  L21_1 = bm
                                  L21_1 = L21_1.RelatedStringBMReport
                                  L18_1(L19_1, L20_1, L21_1)
                                  L18_1 = "genj_linux_ransom_meta"
                                  L19_1 = {}
                                  L20_1 = AppendToRollingQueue
                                  L21_1 = L18_1
                                  L22_1 = "cur_image_path"
                                  L23_1 = L3_1
                                  L20_1(L21_1, L22_1, L23_1)
                                  L20_1 = AppendToRollingQueue
                                  L21_1 = L18_1
                                  L22_1 = "proc_info"
                                  L23_1 = L4_1
                                  L20_1(L21_1, L22_1, L23_1)
                                  L20_1 = AppendToRollingQueue
                                  L21_1 = L18_1
                                  L22_1 = "appended_ext"
                                  L23_1 = L17_1
                                  L20_1(L21_1, L22_1, L23_1)
                                  L20_1 = pairs
                                  L21_1 = L5_1[L17_1]
                                  L20_1, L21_1, L22_1 = L20_1(L21_1)
                                  for L23_1, L24_1 in L20_1, L21_1, L22_1 do
                                    L25_1 = bm
                                    L25_1 = L25_1.add_related_file
                                    L26_1 = sigattr_tail
                                    L26_1 = L26_1[L24_1]
                                    L26_1 = L26_1.utf8p1
                                    L25_1(L26_1)
                                    L25_1 = table
                                    L25_1 = L25_1.insert
                                    L26_1 = L19_1
                                    L27_1 = sigattr_tail
                                    L27_1 = L27_1[L24_1]
                                    L27_1 = L27_1.utf8p1
                                    L25_1(L26_1, L27_1)
                                  end
                                  L20_1 = table
                                  L20_1 = L20_1.concat
                                  L21_1 = L19_1
                                  L22_1 = ","
                                  L20_1 = L20_1(L21_1, L22_1)
                                  L21_1 = AppendToRollingQueue
                                  L22_1 = L18_1
                                  L23_1 = "renamed_file_path"
                                  L24_1 = L20_1
                                  L21_1(L22_1, L23_1, L24_1)
                                  L21_1 = bm
                                  L21_1 = L21_1.add_related_string
                                  L22_1 = "file_metadata"
                                  L23_1 = L20_1
                                  L24_1 = bm
                                  L24_1 = L24_1.RelatedStringBMReport
                                  L21_1(L22_1, L23_1, L24_1)
                                  L21_1 = addRelatedProcess
                                  L21_1()
                                  L21_1 = reportRelatedBmHits
                                  L21_1()
                                  L21_1 = TrackPidAndTechniqueBM
                                  L22_1 = "BM"
                                  L23_1 = "T1486"
                                  L24_1 = "Impact_FileEncryption"
                                  L21_1(L22_1, L23_1, L24_1)
                                  L21_1 = mp
                                  L21_1 = L21_1.INFECTED
                                  return L21_1
                                end
                              else
                                L18_1 = {}
                                L19_1 = L10_1
                                L18_1[1] = L19_1
                                L5_1[L17_1] = L18_1
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
          end
        end
      end
    end
  end
  ::lbl_278::
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
