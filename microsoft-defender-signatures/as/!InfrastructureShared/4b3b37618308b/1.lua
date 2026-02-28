local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = 0
L2_1 = 0
L3_1 = {}
L4_1 = {}
L5_1 = 1
L6_1 = L0_1
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = sigattr_tail
  L9_1 = L9_1[L8_1]
  L9_1 = L9_1.utf8p1
  if L9_1 then
    L9_1 = sigattr_tail
    L9_1 = L9_1[L8_1]
    L9_1 = L9_1.utf8p1
    L10_1 = L9_1
    L9_1 = L9_1.byte
    L11_1 = 1
    L9_1 = L9_1(L10_1, L11_1)
    if L9_1 ~= 37 then
      L9_1 = sigattr_tail
      L9_1 = L9_1[L8_1]
      L9_1 = L9_1.attribute
      if L9_1 == 16387 then
        L9_1 = sigattr_tail
        L9_1 = L9_1[L8_1]
        L9_1 = L9_1.utf8p1
        L10_1 = L9_1
        L9_1 = L9_1.lower
        L9_1 = L9_1(L10_1)
        L10_1 = L3_1[L9_1]
        if L10_1 == nil then
          L3_1[L9_1] = L8_1
          L1_1 = L1_1 + 1
        end
      else
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
          L10_1 = L4_1[L9_1]
          if L10_1 == nil then
            L4_1[L9_1] = L8_1
            L2_1 = L2_1 + 1
          end
        end
      end
    end
  end
end
if L1_1 < 5 or L2_1 < 5 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = 0
L6_1 = {}
L7_1 = {}
L8_1 = 1
L9_1 = L0_1
L10_1 = 1
for L11_1 = L8_1, L9_1, L10_1 do
  L12_1 = sigattr_tail
  L12_1 = L12_1[L11_1]
  L12_1 = L12_1.attribute
  if L12_1 == 16384 then
    L12_1 = sigattr_tail
    L12_1 = L12_1[L11_1]
    L12_1 = L12_1.utf8p1
    if L12_1 then
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
        L13_1 = L7_1[L12_1]
        if L13_1 == nil then
          L7_1[L12_1] = L11_1
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
            L17_1 = L13_1
            L16_1 = L13_1.match
            L18_1 = "%.[^%.]+$"
            L16_1 = L16_1(L17_1, L18_1)
            L17_1 = L6_1[L16_1]
            if L17_1 ~= nil then
              L17_1 = table
              L17_1 = L17_1.insert
              L18_1 = L6_1[L16_1]
              L19_1 = L11_1
              L17_1(L18_1, L19_1)
            else
              L17_1 = {}
              L18_1 = L11_1
              L17_1[1] = L18_1
              L6_1[L16_1] = L17_1
            end
            L5_1 = L5_1 + 1
          end
        end
      end
    end
  end
end
if L5_1 < 5 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = {}
L9_1 = pairs
L10_1 = L6_1
L9_1, L10_1, L11_1 = L9_1(L10_1)
for L12_1, L13_1 in L9_1, L10_1, L11_1 do
  L14_1 = L6_1[L12_1]
  L14_1 = #L14_1
  if 5 <= L14_1 then
    L14_1 = string
    L14_1 = L14_1.len
    L15_1 = L12_1
    L14_1 = L14_1(L15_1)
    L15_1 = pairs
    L16_1 = L13_1
    L15_1, L16_1, L17_1 = L15_1(L16_1)
    for L18_1, L19_1 in L15_1, L16_1, L17_1 do
      L20_1 = sigattr_tail
      L20_1 = L20_1[L19_1]
      L20_1 = L20_1.utf8p1
      L21_1 = L20_1
      L20_1 = L20_1.lower
      L20_1 = L20_1(L21_1)
      L21_1 = L3_1[L20_1]
      if L21_1 ~= nil then
        L21_1 = string
        L21_1 = L21_1.len
        L22_1 = L20_1
        L21_1 = L21_1(L22_1)
        if L14_1 < L21_1 then
          L22_1 = string
          L22_1 = L22_1.sub
          L23_1 = L20_1
          L24_1 = 1
          L25_1 = L21_1 - L14_1
          L22_1 = L22_1(L23_1, L24_1, L25_1)
          L23_1 = L4_1[L22_1]
          if L23_1 then
            L23_1 = table
            L23_1 = L23_1.insert
            L24_1 = L8_1
            L25_1 = L22_1
            L23_1(L24_1, L25_1)
            L23_1 = #L8_1
            if 5 <= L23_1 then
              L23_1 = {}
              L24_1 = pairs
              L25_1 = L8_1
              L24_1, L25_1, L26_1 = L24_1(L25_1)
              for L27_1, L28_1 in L24_1, L25_1, L26_1 do
                L29_1 = table
                L29_1 = L29_1.insert
                L30_1 = L23_1
                L31_1 = {}
                L31_1.path = L28_1
                L29_1(L30_1, L31_1)
              end
              L24_1 = {}
              L24_1.file_paths = L23_1
              L24_1.backup_ext = L12_1
              L25_1 = safeJsonSerialize
              L26_1 = L24_1
              L25_1 = L25_1(L26_1)
              L26_1 = bm
              L26_1 = L26_1.trigger_sig
              L27_1 = "GenericRansomware:BackupEncRestore"
              L28_1 = L25_1
              L26_1(L27_1, L28_1)
              L26_1 = bm
              L26_1 = L26_1.add_related_string
              L27_1 = "genh_ransom_meta"
              L28_1 = L25_1
              L29_1 = bm
              L29_1 = L29_1.RelatedStringBMReport
              L26_1(L27_1, L28_1, L29_1)
              L26_1 = mp
              L26_1 = L26_1.INFECTED
              return L26_1
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
