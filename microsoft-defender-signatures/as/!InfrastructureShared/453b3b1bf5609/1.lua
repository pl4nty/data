local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L2_2 = {}
  L3_2 = 0
  L4_2 = mp
  L4_2 = L4_2.SIGATTR_LOG_SZ
  L5_2 = ""
  if A1_2 == 1 then
    L5_2 = "FileAppendBucket1-16"
  elseif A1_2 == 2 then
    L5_2 = "FullFileOverwrite"
  else
    L6_2 = mp
    L6_2 = L6_2.CLEAN
    return L6_2
  end
  L6_2 = 1
  L7_2 = L4_2
  L8_2 = 1
  for L9_2 = L6_2, L7_2, L8_2 do
    L10_2 = pairs
    L11_2 = A0_2
    L10_2, L11_2, L12_2 = L10_2(L11_2)
    for L13_2, L14_2 in L10_2, L11_2, L12_2 do
      L15_2 = sigattr_tail
      L15_2 = L15_2[L9_2]
      L15_2 = L15_2.attribute
      if L15_2 == 16386 then
        L15_2 = sigattr_tail
        L15_2 = L15_2[L9_2]
        L15_2 = L15_2.utf8p1
        L16_2 = L15_2
        L15_2 = L15_2.byte
        L17_2 = 1
        L15_2 = L15_2(L16_2, L17_2)
        if L15_2 ~= 37 then
          L15_2 = sigattr_tail
          L15_2 = L15_2[L9_2]
          L15_2 = L15_2.utf8p2
          L16_2 = sigattr_tail
          L16_2 = L16_2[L13_2]
          L16_2 = L16_2.utf8p1
          if L15_2 == L16_2 then
            L15_2 = A0_2[L13_2]
            L16_2 = sigattr_tail
            L16_2 = L16_2[L9_2]
            L16_2 = L16_2.utf8p1
            L15_2.RenamedPath = L16_2
          end
        end
      end
    end
  end
  L6_2 = 0
  L7_2 = pairs
  L8_2 = A0_2
  L7_2, L8_2, L9_2 = L7_2(L8_2)
  for L10_2, L11_2 in L7_2, L8_2, L9_2 do
    L12_2 = L11_2.path
    L13_2 = sysio
    L13_2 = L13_2.GetFileSize
    L14_2 = L12_2
    L13_2 = L13_2(L14_2)
    if L13_2 == nil then
      L12_2 = L11_2.RenamedPath
      L14_2 = sysio
      L14_2 = L14_2.GetFileSize
      L15_2 = L12_2
      L14_2 = L14_2(L15_2)
      L13_2 = L14_2
    end
    if L13_2 ~= nil and 256 < L13_2 then
      L14_2 = sysio
      L14_2 = L14_2.ReadFile
      L15_2 = L12_2
      L16_2 = 0
      L17_2 = 256
      L14_2 = L14_2(L15_2, L16_2, L17_2)
      if L14_2 ~= nil then
        L15_2 = string
        L15_2 = L15_2.format
        L16_2 = "0x%02X%02X%02X%02X"
        L17_2 = string
        L17_2 = L17_2.byte
        L18_2 = L14_2
        L19_2 = 1
        L20_2 = 4
        L17_2, L18_2, L19_2, L20_2, L21_2 = L17_2(L18_2, L19_2, L20_2)
        L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
        L16_2 = crypto
        L16_2 = L16_2.ComputeEntropy
        L17_2 = L14_2
        L16_2 = L16_2(L17_2)
        if L6_2 == 0 or L6_2 > L16_2 then
          L6_2 = L16_2
        end
        L17_2 = L11_2.RenamedPath
        if L17_2 == L12_2 then
          L17_2 = table
          L17_2 = L17_2.insert
          L18_2 = L2_2
          L19_2 = {}
          L20_2 = L11_2.path
          L19_2.org_path = L20_2
          L19_2.path = L12_2
          L19_2.fileSize = L13_2
          L19_2.magic = L15_2
          L19_2.entropy = L16_2
          L20_2 = tonumber
          L21_2 = L11_2.TotalSizeAppend
          L20_2 = L20_2(L21_2)
          L19_2.appended_size = L20_2
          L20_2 = tonumber
          L21_2 = L11_2.TotalSizeWrite
          L20_2 = L20_2(L21_2)
          L19_2.write_size = L20_2
          L17_2(L18_2, L19_2)
        else
          L17_2 = table
          L17_2 = L17_2.insert
          L18_2 = L2_2
          L19_2 = {}
          L19_2.path = L12_2
          L19_2.fileSize = L13_2
          L19_2.magic = L15_2
          L19_2.entropy = L16_2
          L20_2 = tonumber
          L21_2 = L11_2.TotalSizeAppend
          L20_2 = L20_2(L21_2)
          L19_2.appended_size = L20_2
          L20_2 = tonumber
          L21_2 = L11_2.TotalSizeWrite
          L20_2 = L20_2(L21_2)
          L19_2.write_size = L20_2
          L17_2(L18_2, L19_2)
        end
        L3_2 = L3_2 + 1
      end
    end
    if 5 <= L3_2 and 7 <= L6_2 then
      L14_2 = {}
      L14_2.file_paths = L2_2
      L14_2.bucket = L5_2
      L15_2 = safeJsonSerialize
      L16_2 = L14_2
      L15_2 = L15_2(L16_2)
      L16_2 = bm
      L16_2 = L16_2.add_related_string
      L17_2 = "geng_ransom_meta"
      L18_2 = L15_2
      L19_2 = bm
      L19_2 = L19_2.RelatedStringBMReport
      L16_2(L17_2, L18_2, L19_2)
      if A1_2 == 1 then
        L16_2 = bm
        L16_2 = L16_2.trigger_sig
        L17_2 = "GenericRansomware:FileAppendBucket1:16"
        L18_2 = L15_2
        L16_2(L17_2, L18_2)
      elseif A1_2 == 2 then
        L16_2 = bm
        L16_2 = L16_2.trigger_sig
        L17_2 = "GenericRansomware:FullFileFileOverwrite"
        L18_2 = L15_2
        L16_2(L17_2, L18_2)
      end
      L16_2 = mp
      L16_2 = L16_2.INFECTED
      return L16_2
    end
  end
  L7_2 = mp
  L7_2 = L7_2.CLEAN
  return L7_2
end

reportGenEncryption = L0_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = {}
L3_1 = 0
L4_1 = 0
L5_1 = {}
L6_1 = 0
L7_1 = 0
L8_1 = 1
L9_1 = L0_1
L10_1 = 1
for L11_1 = L8_1, L9_1, L10_1 do
  L12_1 = sigattr_tail
  L12_1 = L12_1[L11_1]
  L12_1 = L12_1.utf8p2
  L13_1 = sigattr_tail
  L13_1 = L13_1[L11_1]
  L13_1 = L13_1.attribute
  if L13_1 == 16385 then
    L13_1 = sigattr_tail
    L13_1 = L13_1[L11_1]
    L13_1 = L13_1.utf8p1
    L14_1 = L13_1
    L13_1 = L13_1.byte
    L15_1 = 1
    L13_1 = L13_1(L14_1, L15_1)
    if L13_1 ~= 37 then
      L14_1 = L12_1
      L13_1 = L12_1.find
      L15_1 = "TotalSizeAppend:0"
      L16_1 = 1
      L17_1 = true
      L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
      if L13_1 == nil then
        L13_1 = sigattr_tail
        L13_1 = L13_1[L11_1]
        L13_1 = L13_1.utf8p1
        L14_1 = L13_1
        L13_1 = L13_1.lower
        L13_1 = L13_1(L14_1)
        L15_1 = L13_1
        L14_1 = L13_1.match
        L16_1 = "%.[^%.]+$"
        L14_1 = L14_1(L15_1, L16_1)
        if L14_1 then
          L15_1 = mp
          L15_1 = L15_1.bitand
          L16_1 = mp
          L16_1 = L16_1.GetExtensionClass
          L17_1 = L14_1
          L16_1 = L16_1(L17_1)
          L17_1 = 3
          L15_1 = L15_1(L16_1, L17_1)
          if L15_1 ~= 0 then
            L15_1 = {}
            L16_1 = L1_1[L13_1]
            if L16_1 == nil then
              L1_1[L13_1] = L11_1
              L16_1 = string
              L16_1 = L16_1.gmatch
              L17_1 = L12_1
              L18_1 = "(%w+):(%w+)"
              L16_1, L17_1, L18_1 = L16_1(L17_1, L18_1)
              for L19_1, L20_1 in L16_1, L17_1, L18_1 do
                L15_1[L19_1] = L20_1
              end
              L16_1 = L15_1.TotalSizeAppend
              if L16_1 then
                L16_1 = tonumber
                L17_1 = L15_1.TotalSizeAppend
                L16_1 = L16_1(L17_1)
                if L16_1 then
                  goto lbl_82
                end
              end
              L16_1 = 0
              ::lbl_82::
              L17_1 = L15_1.LastOff
              if L17_1 then
                L17_1 = tonumber
                L18_1 = L15_1.LastOff
                L17_1 = L17_1(L18_1)
                if L17_1 then
                  goto lbl_91
                end
              end
              L17_1 = 0
              ::lbl_91::
              L18_1 = L15_1.FirstOff
              if L18_1 then
                L18_1 = tonumber
                L19_1 = L15_1.FirstOff
                L18_1 = L18_1(L19_1)
                if L18_1 then
                  goto lbl_100
                end
              end
              L18_1 = 0
              ::lbl_100::
              L19_1 = L15_1.NumWrites
              if L19_1 then
                L19_1 = tonumber
                L20_1 = L15_1.NumWrites
                L19_1 = L19_1(L20_1)
                if L19_1 then
                  goto lbl_109
                end
              end
              L19_1 = 0
              ::lbl_109::
              L20_1 = L15_1.BiggestOff
              if L20_1 then
                L20_1 = tonumber
                L21_1 = L15_1.BiggestOff
                L20_1 = L20_1(L21_1)
                if L20_1 then
                  goto lbl_118
                end
              end
              L20_1 = 0
              ::lbl_118::
              L21_1 = L15_1.SmallestOff
              if L21_1 then
                L21_1 = tonumber
                L22_1 = L15_1.SmallestOff
                L21_1 = L21_1(L22_1)
                if L21_1 then
                  goto lbl_127
                end
              end
              L21_1 = 0
              ::lbl_127::
              L22_1 = L15_1.TotalSizeWrite
              if L22_1 then
                L22_1 = tonumber
                L23_1 = L15_1.TotalSizeWrite
                L22_1 = L22_1(L23_1)
                if L22_1 then
                  goto lbl_136
                end
              end
              L22_1 = 0
              ::lbl_136::
              if L16_1 <= 16 then
                if L20_1 ~= 0 and L18_1 == 0 and L21_1 == 0 and L20_1 == L17_1 then
                  L23_1 = L17_1 + 1
                  if L23_1 == L22_1 and 0 < L19_1 and 0 < L16_1 and L16_1 <= 16 then
                    L15_1.path = L13_1
                    L2_1[L11_1] = L15_1
                    L3_1 = L3_1 + 1
                  end
                end
              else
                L4_1 = L4_1 + 1
              end
              if L19_1 == 1 then
                if L18_1 == 0 and L21_1 == 0 and L17_1 ~= 0 and L17_1 == L20_1 then
                  L23_1 = L20_1 + 1
                  if L23_1 == L22_1 and L22_1 == L16_1 then
                    L15_1.path = L13_1
                    L5_1[L11_1] = L15_1
                    L6_1 = L6_1 + 1
                  end
                end
              else
                L7_1 = L7_1 + 1
              end
            end
          end
        end
      end
    end
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
if L4_1 == 0 and 10 <= L3_1 then
  L9_1 = reportGenEncryption
  L10_1 = L2_1
  L11_1 = 1
  L9_1 = L9_1(L10_1, L11_1)
  L8_1 = L9_1
elseif L7_1 == 0 and 10 <= L6_1 then
  L9_1 = reportGenEncryption
  L10_1 = L5_1
  L11_1 = 2
  L9_1 = L9_1(L10_1, L11_1)
  L8_1 = L9_1
end
L9_1 = mp
L9_1 = L9_1.INFECTED
if L8_1 == L9_1 then
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
