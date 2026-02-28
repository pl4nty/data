local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1
L0_1 = bm
L0_1 = L0_1.GetSignatureMatchDuration
L0_1 = L0_1()
if 100000000 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
L1_1 = L0_1
L0_1 = L0_1.lower
L0_1 = L0_1(L1_1)
if L0_1 ~= nil and L0_1 ~= "" then
  L1_1 = IsExcludedByImagePath
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    goto lbl_26
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_26::
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    L1_1 = L1_1.ppid
end
else
  L1_1 = "-1"
end
L2_1 = isParentPackageManager
L3_1 = L1_1
L4_1 = true
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.SIGATTR_LOG_SZ
L3_1 = {}
L4_1 = 1
L5_1 = L2_1
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
    L9_1 = IsPathIncludedLinuxRansomCheck
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if L9_1 then
      L9_1 = mp
      L9_1 = L9_1.crc32
      L10_1 = 0
      L11_1 = L8_1
      L12_1 = 1
      L13_1 = #L8_1
      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
      L3_1[L9_1] = 1
    end
  end
end
L4_1 = {}
L5_1 = {}
L6_1 = 1
L7_1 = L2_1
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
    L14_1 = L3_1[L13_1]
    if L14_1 == nil then
      L14_1 = L3_1[L12_1]
      if L14_1 == nil then
        goto lbl_277
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
                            L17_1 = "genh_linux_ransom_meta"
                            L18_1 = {}
                            L19_1 = bm
                            L19_1 = L19_1.get_imagepath
                            L19_1 = L19_1()
                            L20_1 = L19_1
                            L19_1 = L19_1.lower
                            L19_1 = L19_1(L20_1)
                            L20_1 = AppendToRollingQueue
                            L21_1 = L17_1
                            L22_1 = "cur_image_path"
                            L23_1 = L19_1
                            L20_1(L21_1, L22_1, L23_1)
                            L20_1 = AppendToRollingQueue
                            L21_1 = L17_1
                            L22_1 = "proc_info"
                            L23_1 = L1_1
                            L20_1(L21_1, L22_1, L23_1)
                            L20_1 = AppendToRollingQueue
                            L21_1 = L17_1
                            L22_1 = "appended_ext"
                            L23_1 = L16_1
                            L20_1(L21_1, L22_1, L23_1)
                            L20_1 = pairs
                            L21_1 = L4_1[L16_1]
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
                              L26_1 = L18_1
                              L27_1 = sigattr_tail
                              L27_1 = L27_1[L24_1]
                              L27_1 = L27_1.utf8p1
                              L25_1(L26_1, L27_1)
                            end
                            L20_1 = table
                            L20_1 = L20_1.concat
                            L21_1 = L18_1
                            L22_1 = ","
                            L20_1 = L20_1(L21_1, L22_1)
                            L21_1 = AppendToRollingQueue
                            L22_1 = L17_1
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
                            L21_1 = bm
                            L21_1 = L21_1.trigger_sig
                            L22_1 = "GenericLinuxRansomware"
                            L23_1 = "Type7"
                            L21_1(L22_1, L23_1)
                            L21_1 = mp
                            L21_1 = L21_1.INFECTED
                            return L21_1
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
  ::lbl_277::
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
