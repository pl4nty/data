local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
L3_1 = L2_1
L2_1 = L2_1.lower
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsExcludedByImagePath
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "/java"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if not L3_1 then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "/PXEngine/"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    goto lbl_43
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_43::
L3_1 = bm
L3_1 = L3_1.get_current_process_startup_info
L3_1 = L3_1()
if L3_1 ~= nil then
  L4_1 = L3_1.ppid
  if L4_1 ~= nil then
    goto lbl_54
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_54::
L4_1 = isParentPackageManager
L5_1 = L3_1.ppid
L6_1 = true
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = 1
L5_1 = L0_1
L6_1 = 1
for L7_1 = L4_1, L5_1, L6_1 do
  L8_1 = sigattr_tail
  L8_1 = L8_1[L7_1]
  L8_1 = L8_1.attribute
  if L8_1 == 16385 then
    L8_1 = sigattr_tail
    L8_1 = L8_1[L7_1]
    L8_1 = L8_1.utf8p1
    L9_1 = L8_1
    L8_1 = L8_1.lower
    L8_1 = L8_1(L9_1)
    L9_1 = mp
    L9_1 = L9_1.crc32
    L10_1 = 0
    L11_1 = L8_1
    L12_1 = 1
    L13_1 = #L8_1
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    L1_1[L9_1] = 1
  end
end
L4_1 = {}
L5_1 = {}
L6_1 = 1
L7_1 = L0_1
L8_1 = 1
for L9_1 = L6_1, L7_1, L8_1 do
  L10_1 = sigattr_tail
  L10_1 = L10_1[L9_1]
  L10_1 = L10_1.attribute
  if L10_1 == 16386 then
    L10_1 = sigattr_tail
    L10_1 = L10_1[L9_1]
    L10_1 = L10_1.utf8p2
    L11_1 = L10_1
    L10_1 = L10_1.lower
    L10_1 = L10_1(L11_1)
    L11_1 = sigattr_tail
    L11_1 = L11_1[L9_1]
    L11_1 = L11_1.utf8p1
    L12_1 = L11_1
    L11_1 = L11_1.lower
    L11_1 = L11_1(L12_1)
    if L10_1 ~= nil and L11_1 ~= nil then
      L12_1 = mp
      L12_1 = L12_1.crc32
      L13_1 = 0
      L14_1 = L10_1
      L15_1 = 1
      L16_1 = #L10_1
      L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
      L13_1 = mp
      L13_1 = L13_1.crc32
      L14_1 = 0
      L15_1 = L11_1
      L16_1 = 1
      L17_1 = #L11_1
      L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
      L14_1 = L1_1[L13_1]
      if L14_1 == nil then
        L14_1 = L1_1[L12_1]
        if L14_1 == nil then
          goto lbl_304
        end
      end
      L14_1 = L5_1[L12_1]
      if L14_1 == nil then
        L15_1 = L10_1
        L14_1 = L10_1.match
        L16_1 = "%.[^/%.]+$"
        L14_1 = L14_1(L15_1, L16_1)
        if L14_1 ~= nil then
          L15_1 = mp
          L15_1 = L15_1.GetExtensionClass
          L16_1 = L14_1
          L15_1 = L15_1(L16_1)
          if L15_1 ~= 3 then
            L15_1 = #L10_1
            L16_1 = #L11_1
            if L15_1 < L16_1 then
              L16_1 = L11_1
              L15_1 = L11_1.find
              L17_1 = L10_1
              L18_1 = 1
              L19_1 = true
              L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
              if L15_1 == 1 then
                L16_1 = L11_1
                L15_1 = L11_1.byte
                L17_1 = #L10_1
                L17_1 = L17_1 + 1
                L15_1 = L15_1(L16_1, L17_1)
                if L15_1 == 46 then
                  L16_1 = L11_1
                  L15_1 = L11_1.byte
                  L17_1 = #L10_1
                  L17_1 = L17_1 + 1
                  L15_1 = L15_1(L16_1, L17_1)
                  if L15_1 ~= 58 then
                    L5_1[L12_1] = 1
                    L16_1 = L11_1
                    L15_1 = L11_1.match
                    L17_1 = "%.[^/%.]+$"
                    L15_1 = L15_1(L16_1, L17_1)
                    if L15_1 ~= nil then
                      L16_1 = mp
                      L16_1 = L16_1.GetExtensionClass
                      L17_1 = L15_1
                      L16_1 = L16_1(L17_1)
                      if L16_1 ~= 4 then
                        L16_1 = IsExcludedByImagePathFileExtension
                        L17_1 = L2_1
                        L18_1 = L15_1
                        L16_1 = L16_1(L17_1, L18_1)
                        if L16_1 == false then
                          L16_1 = IsExcludedByImagePathFileExtensionRegEx
                          L17_1 = L2_1
                          L18_1 = L15_1
                          L16_1 = L16_1(L17_1, L18_1)
                          if L16_1 == false then
                            L16_1 = IsExtensionDatePattern
                            L17_1 = L15_1
                            L16_1 = L16_1(L17_1)
                            if L16_1 == false then
                              L16_1 = string
                              L16_1 = L16_1.sub
                              L17_1 = L11_1
                              L18_1 = #L10_1
                              L18_1 = L18_1 + 1
                              L16_1 = L16_1(L17_1, L18_1)
                              L17_1 = L4_1[L16_1]
                              if L17_1 ~= nil then
                                L17_1 = table
                                L17_1 = L17_1.insert
                                L18_1 = L4_1[L16_1]
                                L19_1 = L9_1
                                L17_1(L18_1, L19_1)
                                L17_1 = L4_1[L16_1]
                                L17_1 = #L17_1
                                if 5 <= L17_1 then
                                  L17_1 = bm
                                  L17_1 = L17_1.add_related_string
                                  L18_1 = "ransom_extension"
                                  L19_1 = L16_1
                                  L20_1 = bm
                                  L20_1 = L20_1.RelatedStringBMReport
                                  L17_1(L18_1, L19_1, L20_1)
                                  L17_1 = "genb_linux_ransom_meta"
                                  L18_1 = {}
                                  L19_1 = AppendToRollingQueue
                                  L20_1 = L17_1
                                  L21_1 = "cur_image_path"
                                  L22_1 = L2_1
                                  L19_1(L20_1, L21_1, L22_1)
                                  L19_1 = AppendToRollingQueue
                                  L20_1 = L17_1
                                  L21_1 = "proc_info"
                                  L22_1 = L3_1.ppid
                                  L19_1(L20_1, L21_1, L22_1)
                                  L19_1 = AppendToRollingQueue
                                  L20_1 = L17_1
                                  L21_1 = "appended_ext"
                                  L22_1 = L16_1
                                  L19_1(L20_1, L21_1, L22_1)
                                  L19_1 = pairs
                                  L20_1 = L4_1[L16_1]
                                  L19_1, L20_1, L21_1 = L19_1(L20_1)
                                  for L22_1, L23_1 in L19_1, L20_1, L21_1 do
                                    L24_1 = bm
                                    L24_1 = L24_1.add_related_file
                                    L25_1 = sigattr_tail
                                    L25_1 = L25_1[L23_1]
                                    L25_1 = L25_1.utf8p1
                                    L24_1(L25_1)
                                    L24_1 = table
                                    L24_1 = L24_1.insert
                                    L25_1 = L18_1
                                    L26_1 = sigattr_tail
                                    L26_1 = L26_1[L23_1]
                                    L26_1 = L26_1.utf8p1
                                    L24_1(L25_1, L26_1)
                                  end
                                  L19_1 = table
                                  L19_1 = L19_1.concat
                                  L20_1 = L18_1
                                  L21_1 = ","
                                  L19_1 = L19_1(L20_1, L21_1)
                                  L20_1 = AppendToRollingQueue
                                  L21_1 = L17_1
                                  L22_1 = "renamed_file_path"
                                  L23_1 = L19_1
                                  L20_1(L21_1, L22_1, L23_1)
                                  L20_1 = bm
                                  L20_1 = L20_1.add_related_string
                                  L21_1 = "file_metadata"
                                  L22_1 = L19_1
                                  L23_1 = bm
                                  L23_1 = L23_1.RelatedStringBMReport
                                  L20_1(L21_1, L22_1, L23_1)
                                  L20_1 = bm
                                  L20_1 = L20_1.add_related_string
                                  L21_1 = "cur_image_path"
                                  L22_1 = L2_1
                                  L23_1 = bm
                                  L23_1 = L23_1.RelatedStringBMReport
                                  L20_1(L21_1, L22_1, L23_1)
                                  L20_1 = addRelatedProcess
                                  L20_1()
                                  L20_1 = reportRelatedBmHits
                                  L20_1()
                                  L20_1 = TrackPidAndTechniqueBM
                                  L21_1 = "BM"
                                  L22_1 = "T1486"
                                  L23_1 = "Impact_FileEncryption"
                                  L20_1(L21_1, L22_1, L23_1)
                                  L20_1 = bm
                                  L20_1 = L20_1.trigger_sig
                                  L21_1 = "GenericLinuxRansomware"
                                  L22_1 = "Type5"
                                  L20_1(L21_1, L22_1)
                                  L20_1 = mp
                                  L20_1 = L20_1.INFECTED
                                  return L20_1
                                end
                              else
                                L17_1 = {}
                                L18_1 = L9_1
                                L17_1[1] = L18_1
                                L4_1[L16_1] = L17_1
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
  ::lbl_304::
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
