local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = 0
  L2_2 = nil
  L3_2 = pairs
  L4_2 = A0_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L9_2 = L6_2
    L8_2 = L6_2.match
    L10_2 = "([.%w]+)-([0-9a-fA-F]+)"
    L8_2, L9_2 = L8_2(L9_2, L10_2)
    if L8_2 ~= nil and L9_2 ~= nil then
      L11_2 = L9_2
      L10_2 = L9_2.len
      L10_2 = L10_2(L11_2)
      if L10_2 == 8 then
        L11_2 = L8_2
        L10_2 = L8_2.len
        L10_2 = L10_2(L11_2)
        if 3 < L10_2 then
          if L2_2 == nil then
            L2_2 = L8_2
            L1_2 = L1_2 + 1
          elseif L2_2 == L8_2 then
            L1_2 = L1_2 + 1
          end
        end
      end
    end
  end
  return L1_2
end

DefrayExtensionCheck = L0_1
L0_1 = bm
L0_1 = L0_1.GetSignatureMatchDuration
L0_1 = L0_1()
if 100000000 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = 1
L3_1 = L0_1
L4_1 = 1
for L5_1 = L2_1, L3_1, L4_1 do
  L6_1 = sigattr_tail
  L6_1 = L6_1[L5_1]
  L6_1 = L6_1.attribute
  if L6_1 == 16385 then
    L6_1 = sigattr_tail
    L6_1 = L6_1[L5_1]
    L6_1 = L6_1.utf8p1
    L7_1 = L6_1
    L6_1 = L6_1.lower
    L6_1 = L6_1(L7_1)
    L7_1 = mp
    L7_1 = L7_1.crc32
    L8_1 = 0
    L9_1 = L6_1
    L10_1 = 1
    L11_1 = #L6_1
    L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
    L1_1[L7_1] = 1
  end
end
L2_1 = {}
L3_1 = {}
L4_1 = 0
L5_1 = 0
L6_1 = {}
L7_1 = 0
L8_1 = 8
L9_1 = 1
L10_1 = L0_1
L11_1 = 1
for L12_1 = L9_1, L10_1, L11_1 do
  L13_1 = sigattr_tail
  L13_1 = L13_1[L12_1]
  L13_1 = L13_1.attribute
  if L13_1 == 16386 then
    L13_1 = sigattr_tail
    L13_1 = L13_1[L12_1]
    L13_1 = L13_1.utf8p2
    L14_1 = L13_1
    L13_1 = L13_1.lower
    L13_1 = L13_1(L14_1)
    L14_1 = sigattr_tail
    L14_1 = L14_1[L12_1]
    L14_1 = L14_1.utf8p1
    L15_1 = L14_1
    L14_1 = L14_1.lower
    L14_1 = L14_1(L15_1)
    L15_1 = mp
    L15_1 = L15_1.crc32
    L16_1 = 0
    L17_1 = L13_1
    L18_1 = 1
    L19_1 = #L13_1
    L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
    L16_1 = mp
    L16_1 = L16_1.crc32
    L17_1 = 0
    L18_1 = L14_1
    L19_1 = 1
    L20_1 = #L14_1
    L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
    L17_1 = L1_1[L16_1]
    if L17_1 == nil then
      L17_1 = L1_1[L15_1]
      if L17_1 == nil then
        goto lbl_158
      end
    end
    L17_1 = L6_1[L15_1]
    if L17_1 == nil then
      L18_1 = L13_1
      L17_1 = L13_1.match
      L19_1 = "%.[^/%.]+$"
      L17_1 = L17_1(L18_1, L19_1)
      if L17_1 ~= nil then
        L18_1 = mp
        L18_1 = L18_1.GetExtensionClass
        L19_1 = L17_1
        L18_1 = L18_1(L19_1)
        if L18_1 ~= 3 then
          L18_1 = #L13_1
          L19_1 = #L14_1
          if L18_1 < L19_1 then
            L19_1 = L14_1
            L18_1 = L14_1.find
            L20_1 = L13_1
            L21_1 = 1
            L22_1 = true
            L18_1 = L18_1(L19_1, L20_1, L21_1, L22_1)
            if L18_1 == 1 then
              L19_1 = L14_1
              L18_1 = L14_1.byte
              L20_1 = #L13_1
              L20_1 = L20_1 + 1
              L18_1 = L18_1(L19_1, L20_1)
              if L18_1 ~= 58 then
                L6_1[L15_1] = 1
                L19_1 = L14_1
                L18_1 = L14_1.match
                L20_1 = "%.[^/%.]+$"
                L18_1 = L18_1(L19_1, L20_1)
                L19_1 = mp
                L19_1 = L19_1.GetExtensionClass
                L20_1 = L18_1
                L19_1 = L19_1(L20_1)
                if L19_1 ~= 4 then
                  L19_1 = IsExtensionDatePattern
                  L20_1 = L18_1
                  L19_1 = L19_1(L20_1)
                  if L19_1 == false then
                    L19_1 = string
                    L19_1 = L19_1.sub
                    L20_1 = L14_1
                    L21_1 = #L13_1
                    L21_1 = L21_1 + 1
                    L19_1 = L19_1(L20_1, L21_1)
                    L20_1 = L2_1[L19_1]
                    if L20_1 ~= nil then
                      L20_1 = L3_1[L19_1]
                      if L20_1 ~= nil then
                        L3_1[L19_1] = nil
                        L4_1 = L4_1 - 1
                      end
                    else
                      L20_1 = {}
                      L21_1 = L12_1
                      L20_1[1] = L21_1
                      L2_1[L19_1] = L20_1
                      L5_1 = L5_1 + 1
                      L20_1 = {}
                      L21_1 = L12_1
                      L20_1[1] = L21_1
                      L3_1[L19_1] = L20_1
                      L4_1 = L4_1 + 1
                    end
                    if L8_1 <= L4_1 then
                      L7_1 = 1
                      break
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
  ::lbl_158::
end
if L7_1 == 1 then
  L9_1 = "Type4"
  L10_1 = "genf_linux_ransom_meta"
  L11_1 = {}
  L12_1 = string
  L12_1 = L12_1.lower
  L13_1 = bm
  L13_1 = L13_1.get_imagepath
  L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1 = L13_1()
  L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1)
  L13_1 = bm
  L13_1 = L13_1.get_current_process_startup_info
  L13_1 = L13_1()
  if L13_1 ~= nil then
    L13_1 = L13_1.ppid
  else
    L13_1 = "-1"
  end
  L14_1 = AppendToRollingQueue
  L15_1 = L10_1
  L16_1 = "cur_image_path"
  L17_1 = L12_1
  L14_1(L15_1, L16_1, L17_1)
  L14_1 = AppendToRollingQueue
  L15_1 = L10_1
  L16_1 = "proc_info"
  L17_1 = L13_1
  L14_1(L15_1, L16_1, L17_1)
  L14_1 = DefrayExtensionCheck
  L15_1 = L3_1
  L14_1 = L14_1(L15_1)
  if L8_1 <= L14_1 then
    L9_1 = "Defray.GenF"
  end
  L15_1 = ""
  L16_1 = pairs
  L17_1 = L3_1
  L16_1, L17_1, L18_1 = L16_1(L17_1)
  for L19_1, L20_1 in L16_1, L17_1, L18_1 do
    L21_1 = L15_1
    L22_1 = ","
    L23_1 = L19_1
    L15_1 = L21_1 .. L22_1 .. L23_1
  end
  L16_1 = bm
  L16_1 = L16_1.add_related_string
  L17_1 = "ransom_extension"
  L18_1 = L15_1
  L19_1 = bm
  L19_1 = L19_1.RelatedStringBMReport
  L16_1(L17_1, L18_1, L19_1)
  L16_1 = AppendToRollingQueue
  L17_1 = L10_1
  L18_1 = "appended_ext"
  L19_1 = L15_1
  L16_1(L17_1, L18_1, L19_1)
  L16_1 = pairs
  L17_1 = L3_1
  L16_1, L17_1, L18_1 = L16_1(L17_1)
  for L19_1, L20_1 in L16_1, L17_1, L18_1 do
    L21_1 = pairs
    L22_1 = L3_1[L19_1]
    L21_1, L22_1, L23_1 = L21_1(L22_1)
    for L24_1, L25_1 in L21_1, L22_1, L23_1 do
      L26_1 = bm
      L26_1 = L26_1.add_related_file
      L27_1 = sigattr_tail
      L27_1 = L27_1[L25_1]
      L27_1 = L27_1.utf8p1
      L26_1(L27_1)
      L26_1 = table
      L26_1 = L26_1.insert
      L27_1 = L11_1
      L28_1 = sigattr_tail
      L28_1 = L28_1[L25_1]
      L28_1 = L28_1.utf8p1
      L26_1(L27_1, L28_1)
    end
  end
  L16_1 = AppendToRollingQueue
  L17_1 = L10_1
  L18_1 = "renamed_file_path"
  L19_1 = table
  L19_1 = L19_1.concat
  L20_1 = L11_1
  L21_1 = ","
  L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1 = L19_1(L20_1, L21_1)
  L16_1(L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1)
  L16_1 = addRelatedProcess
  L16_1()
  L16_1 = reportRelatedBmHits
  L16_1()
  L16_1 = TrackPidAndTechniqueBM
  L17_1 = "BM"
  L18_1 = "T1486"
  L19_1 = "Impact_FileEncryption"
  L16_1(L17_1, L18_1, L19_1)
  L16_1 = bm
  L16_1 = L16_1.trigger_sig
  L17_1 = "GenericLinuxRansomware"
  L18_1 = L9_1
  L16_1(L17_1, L18_1)
  L16_1 = mp
  L16_1 = L16_1.INFECTED
  return L16_1
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
