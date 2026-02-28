local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = "^(.+)//"
  L2_2 = "^(.+)\\"
  L3_2 = string
  L3_2 = L3_2.match
  L4_2 = A0_2
  L5_2 = L1_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L3_2 = string
    L3_2 = L3_2.match
    L4_2 = A0_2
    L5_2 = L2_2
    L3_2 = L3_2(L4_2, L5_2)
  end
  if L3_2 ~= nil then
    return L3_2
  else
    L4_2 = nil
    return L4_2
  end
end

L1_1 = mp
L1_1 = L1_1.SIGATTR_LOG_SZ
L2_1 = {}
L3_1 = {}
L4_1 = "%.[^%.%\\][%w_]+$"
L5_1 = 1
L6_1 = L1_1
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = 0
  L10_1 = sigattr_tail
  L10_1 = L10_1[L8_1]
  L10_1 = L10_1.attribute
  if L10_1 == 16385 then
    L10_1 = sigattr_tail
    L10_1 = L10_1[L8_1]
    L10_1 = L10_1.utf8p1
    L11_1 = L10_1
    L10_1 = L10_1.lower
    L10_1 = L10_1(L11_1)
    L12_1 = L10_1
    L11_1 = L10_1.byte
    L13_1 = 1
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 == 37 then
      L9_1 = 1
    end
    if L9_1 == 0 then
      L11_1 = mp
      L11_1 = L11_1.crc32
      L12_1 = 0
      L13_1 = L10_1
      L14_1 = 1
      L15_1 = #L10_1
      L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
      L2_1[L11_1] = 1
    end
  end
end
L5_1 = 1
L6_1 = L1_1
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = sigattr_tail
  L9_1 = L9_1[L8_1]
  L9_1 = L9_1.attribute
  L10_1 = 0
  if L9_1 == 16389 then
    L11_1 = sigattr_tail
    L11_1 = L11_1[L8_1]
    L11_1 = L11_1.utf8p2
    if L11_1 == "ATTR_c09458eb" then
      L11_1 = sigattr_tail
      L11_1 = L11_1[L8_1]
      L11_1 = L11_1.utf8p1
      L12_1 = L11_1
      L11_1 = L11_1.lower
      L11_1 = L11_1(L12_1)
      L13_1 = L11_1
      L12_1 = L11_1.byte
      L14_1 = 1
      L12_1 = L12_1(L13_1, L14_1)
      if L12_1 == 37 then
        L10_1 = 1
      end
      if L10_1 == 0 then
        L12_1 = mp
        L12_1 = L12_1.crc32
        L13_1 = 0
        L14_1 = L11_1
        L15_1 = 1
        L16_1 = #L11_1
        L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
        L13_1 = L2_1[L12_1]
        if L13_1 ~= nil then
          L3_1[L12_1] = 1
        end
      end
    end
  end
end
L5_1 = {}
L6_1 = 1
L7_1 = L1_1
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
    L13_1 = L10_1
    L12_1 = L10_1.match
    L14_1 = L4_1
    L12_1 = L12_1(L13_1, L14_1)
    L14_1 = L11_1
    L13_1 = L11_1.match
    L15_1 = L4_1
    L13_1 = L13_1(L14_1, L15_1)
    if L12_1 ~= nil and L13_1 ~= nil then
      L14_1 = mp
      L14_1 = L14_1.crc32
      L15_1 = 0
      L16_1 = L11_1
      L17_1 = 1
      L18_1 = #L11_1
      L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
      L15_1 = mp
      L15_1 = L15_1.GetExtensionClass
      L16_1 = L12_1
      L15_1 = L15_1(L16_1)
      if L15_1 ~= 4 then
        L15_1 = mp
        L15_1 = L15_1.GetExtensionClass
        L16_1 = L13_1
        L15_1 = L15_1(L16_1)
        if L15_1 == 0 then
          L15_1 = L3_1[L14_1]
          if L15_1 ~= nil then
            L15_1 = L0_1
            L16_1 = L10_1
            L15_1 = L15_1(L16_1)
            L16_1 = mp
            L16_1 = L16_1.crc32
            L17_1 = 0
            L18_1 = L15_1
            L19_1 = 1
            L20_1 = #L15_1
            L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
            L17_1 = L5_1[L13_1]
            if L17_1 == nil then
              L17_1 = {}
              L17_1.dirCount = 0
              L17_1.fileCount = 0
              L5_1[L13_1] = L17_1
            end
            L17_1 = L5_1[L13_1]
            L17_1 = L17_1[L16_1]
            if L17_1 == nil then
              L17_1 = L5_1[L13_1]
              L18_1 = L5_1[L13_1]
              L18_1 = L18_1.dirCount
              L18_1 = L18_1 + 1
              L17_1.dirCount = L18_1
              L17_1 = L5_1[L13_1]
              L18_1 = {}
              L17_1[L16_1] = L18_1
            end
            L17_1 = L5_1[L13_1]
            L17_1 = L17_1[L16_1]
            L17_1 = L17_1[L14_1]
            if L17_1 == nil then
              L17_1 = L5_1[L13_1]
              L18_1 = L5_1[L13_1]
              L18_1 = L18_1.fileCount
              L18_1 = L18_1 + 1
              L17_1.fileCount = L18_1
              L17_1 = L5_1[L13_1]
              L17_1 = L17_1[L16_1]
              L17_1[L14_1] = L9_1
            end
          end
        end
      end
    end
  end
end
L6_1 = pairs
L7_1 = L5_1
L6_1, L7_1, L8_1 = L6_1(L7_1)
for L9_1, L10_1 in L6_1, L7_1, L8_1 do
  L11_1 = L10_1.dirCount
  if 3 <= L11_1 then
    L11_1 = L10_1.fileCount
    if 6 <= L11_1 then
      goto lbl_187
    end
  end
  L11_1 = L10_1.fileCount
  ::lbl_187::
  if 15 < L11_1 then
    L11_1 = bm
    L11_1 = L11_1.add_related_string
    L12_1 = "ransom_extension"
    L13_1 = L9_1
    L14_1 = bm
    L14_1 = L14_1.RelatedStringBMReport
    L11_1(L12_1, L13_1, L14_1)
    L11_1 = {}
    L12_1 = bm
    L12_1 = L12_1.get_imagepath
    L12_1 = L12_1()
    L13_1 = L12_1
    L12_1 = L12_1.lower
    L12_1 = L12_1(L13_1)
    L13_1 = bm
    L13_1 = L13_1.get_current_process_startup_info
    L13_1 = L13_1()
    if L13_1 ~= nil then
      L13_1 = L13_1.ppid
    else
      L13_1 = -1
    end
    L14_1 = pairs
    L15_1 = L10_1
    L14_1, L15_1, L16_1 = L14_1(L15_1)
    for L17_1, L18_1 in L14_1, L15_1, L16_1 do
      L19_1 = type
      L20_1 = L18_1
      L19_1 = L19_1(L20_1)
      if L19_1 == "table" then
        L19_1 = pairs
        L20_1 = L18_1
        L19_1, L20_1, L21_1 = L19_1(L20_1)
        for L22_1, L23_1 in L19_1, L20_1, L21_1 do
          L24_1 = bm
          L24_1 = L24_1.add_related_file
          L25_1 = sigattr_tail
          L25_1 = L25_1[L23_1]
          L25_1 = L25_1.utf8p1
          L24_1(L25_1)
        end
      end
    end
    L11_1.current_image_path = L12_1
    L11_1.extension = L9_1
    L14_1 = safeJsonSerialize
    L15_1 = L5_1
    L14_1 = L14_1(L15_1)
    L11_1.ext_data = L14_1
    L14_1 = bm
    L14_1 = L14_1.get_process_relationships
    L14_1, L15_1 = L14_1()
    L16_1 = ipairs
    L17_1 = L14_1
    L16_1, L17_1, L18_1 = L16_1(L17_1)
    for L19_1, L20_1 in L16_1, L17_1, L18_1 do
      L21_1 = L20_1.image_path
      if L21_1 ~= nil then
        L21_1 = bm
        L21_1 = L21_1.add_related_process
        L22_1 = L20_1.ppid
        L21_1(L22_1)
      end
    end
    L16_1 = ipairs
    L17_1 = L15_1
    L16_1, L17_1, L18_1 = L16_1(L17_1)
    for L19_1, L20_1 in L16_1, L17_1, L18_1 do
      L21_1 = L20_1.image_path
      if L21_1 ~= nil then
        L21_1 = bm
        L21_1 = L21_1.add_related_process
        L22_1 = L20_1.ppid
        L21_1(L22_1)
      end
    end
    L16_1 = MpCommon
    L16_1 = L16_1.OverwritePersistContextNoPath
    L17_1 = "gene_ransom_meta"
    L18_1 = L11_1
    L19_1 = 700
    L16_1(L17_1, L18_1, L19_1)
    L16_1 = safeJsonSerialize
    L17_1 = L11_1
    L16_1 = L16_1(L17_1)
    L17_1 = bm
    L17_1 = L17_1.add_related_string
    L18_1 = "GenericRansomware"
    L19_1 = L16_1
    L20_1 = bm
    L20_1 = L20_1.RelatedStringBMReport
    L17_1(L18_1, L19_1, L20_1)
    L17_1 = bm
    L17_1 = L17_1.trigger_sig
    L18_1 = "GenericRansomware:Type2.4"
    L19_1 = L16_1
    L17_1(L18_1, L19_1)
    L17_1 = bm
    L17_1 = L17_1.add_action
    L18_1 = "SmsAsyncScanEvent"
    L19_1 = 100
    L17_1(L18_1, L19_1)
    L17_1 = reportSessionInformationInclusive
    L17_1()
    L17_1 = reportTimingData
    L17_1()
    L17_1 = mp
    L17_1 = L17_1.INFECTED
    return L17_1
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
