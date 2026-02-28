local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = {}
L3_1 = 0
L4_1 = 0
L5_1 = 1
L6_1 = L0_1
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = sigattr_tail
  L9_1 = L9_1[L8_1]
  L9_1 = L9_1.utf8p2
  L10_1 = sigattr_tail
  L10_1 = L10_1[L8_1]
  L10_1 = L10_1.attribute
  if L10_1 == 16385 then
    L10_1 = sigattr_tail
    L10_1 = L10_1[L8_1]
    L10_1 = L10_1.utf8p1
    L11_1 = L10_1
    L10_1 = L10_1.byte
    L12_1 = 1
    L10_1 = L10_1(L11_1, L12_1)
    if L10_1 ~= 37 then
      L11_1 = L9_1
      L10_1 = L9_1.find
      L12_1 = "TotalSizeAppend:0"
      L13_1 = 1
      L14_1 = true
      L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
      if L10_1 == nil then
        L10_1 = sigattr_tail
        L10_1 = L10_1[L8_1]
        L10_1 = L10_1.utf8p1
        L11_1 = L10_1
        L10_1 = L10_1.lower
        L10_1 = L10_1(L11_1)
        L12_1 = L10_1
        L11_1 = L10_1.match
        L13_1 = "%.[^%.]+$"
        L11_1 = L11_1(L12_1, L13_1)
        if L11_1 then
          L12_1 = mp
          L12_1 = L12_1.bitand
          L13_1 = mp
          L13_1 = L13_1.GetExtensionClass
          L14_1 = L11_1
          L13_1 = L13_1(L14_1)
          L14_1 = 3
          L12_1 = L12_1(L13_1, L14_1)
          if L12_1 ~= 0 then
            L12_1 = {}
            L13_1 = L1_1[L10_1]
            if L13_1 == nil then
              L1_1[L10_1] = L8_1
              L13_1 = string
              L13_1 = L13_1.gmatch
              L14_1 = L9_1
              L15_1 = "(%w+):(%w+)"
              L13_1, L14_1, L15_1 = L13_1(L14_1, L15_1)
              for L16_1, L17_1 in L13_1, L14_1, L15_1 do
                L12_1[L16_1] = L17_1
              end
              L13_1 = L12_1.TotalSizeAppend
              if L13_1 then
                L13_1 = tonumber
                L14_1 = L12_1.TotalSizeAppend
                L13_1 = L13_1(L14_1)
                if L13_1 then
                  goto lbl_77
                end
              end
              L13_1 = 0
              ::lbl_77::
              if 0 < L13_1 then
                if 16 < L13_1 then
                  L4_1 = L4_1 + 1
                  break
                end
                L14_1 = L12_1.LastOff
                if L14_1 then
                  L14_1 = tonumber
                  L15_1 = L12_1.LastOff
                  L14_1 = L14_1(L15_1)
                  if L14_1 then
                    goto lbl_92
                  end
                end
                L14_1 = 0
                ::lbl_92::
                L15_1 = L12_1.FirstOff
                if L15_1 then
                  L15_1 = tonumber
                  L16_1 = L12_1.FirstOff
                  L15_1 = L15_1(L16_1)
                  if L15_1 then
                    goto lbl_101
                  end
                end
                L15_1 = 0
                ::lbl_101::
                L16_1 = L12_1.NumWrites
                if L16_1 then
                  L16_1 = tonumber
                  L17_1 = L12_1.NumWrites
                  L16_1 = L16_1(L17_1)
                  if L16_1 then
                    goto lbl_110
                  end
                end
                L16_1 = 0
                ::lbl_110::
                L17_1 = L12_1.BiggestOff
                if L17_1 then
                  L17_1 = tonumber
                  L18_1 = L12_1.BiggestOff
                  L17_1 = L17_1(L18_1)
                  if L17_1 then
                    goto lbl_119
                  end
                end
                L17_1 = 0
                ::lbl_119::
                L18_1 = L12_1.SmallestOff
                if L18_1 then
                  L18_1 = tonumber
                  L19_1 = L12_1.SmallestOff
                  L18_1 = L18_1(L19_1)
                  if L18_1 then
                    goto lbl_128
                  end
                end
                L18_1 = 0
                ::lbl_128::
                L19_1 = L12_1.TotalSizeWrite
                if L19_1 then
                  L19_1 = tonumber
                  L20_1 = L12_1.TotalSizeWrite
                  L19_1 = L19_1(L20_1)
                  if L19_1 then
                    goto lbl_137
                  end
                end
                L19_1 = 0
                ::lbl_137::
                if L17_1 ~= 0 and L15_1 == 0 and L18_1 == 0 and L17_1 == L14_1 then
                  L20_1 = L14_1 + 1
                  if L20_1 == L19_1 and 0 < L16_1 and 0 < L13_1 and L13_1 <= 16 then
                    if 10 <= L3_1 then
                      break
                    elseif L3_1 < 10 then
                      L12_1.path = L10_1
                      L2_1[L8_1] = L12_1
                    end
                    L3_1 = L3_1 + 1
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
L5_1 = {}
L6_1 = 0
if L4_1 == 0 and 10 <= L3_1 then
  L7_1 = pairs
  L8_1 = L2_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1, L11_1 in L7_1, L8_1, L9_1 do
    L12_1 = sigattr_tail
    L12_1 = L12_1[L10_1]
    L12_1 = L12_1.utf8p1
    L13_1 = sysio
    L13_1 = L13_1.GetFileSize
    L14_1 = L12_1
    L13_1 = L13_1(L14_1)
    if L13_1 ~= nil and 256 < L13_1 then
      L14_1 = tonumber
      L15_1 = L11_1.TotalSizeWrite
      L14_1 = L14_1(L15_1)
      if L13_1 == L14_1 then
        L14_1 = sysio
        L14_1 = L14_1.ReadFile
        L15_1 = L12_1
        L16_1 = 0
        L17_1 = 256
        L14_1 = L14_1(L15_1, L16_1, L17_1)
        if L14_1 ~= nil then
          L15_1 = string
          L15_1 = L15_1.format
          L16_1 = "\\x%02X\\x%02X\\x%02X\\x%02X"
          L17_1 = string
          L17_1 = L17_1.byte
          L18_1 = L14_1
          L19_1 = 1
          L20_1 = 4
          L17_1, L18_1, L19_1, L20_1, L21_1 = L17_1(L18_1, L19_1, L20_1)
          L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
          L16_1 = crypto
          L16_1 = L16_1.ComputeEntropy
          L17_1 = L14_1
          L16_1 = L16_1(L17_1)
          L17_1 = table
          L17_1 = L17_1.insert
          L18_1 = L5_1
          L19_1 = {}
          L19_1.FilePath = L12_1
          L19_1.Filesize = L13_1
          L19_1.MagicByte = L15_1
          L19_1.Entropy = L16_1
          L20_1 = tonumber
          L21_1 = L11_1.TotalSizeAppend
          L20_1 = L20_1(L21_1)
          L19_1.AppendedSize = L20_1
          L20_1 = tonumber
          L21_1 = L11_1.TotalSizeWrite
          L20_1 = L20_1(L21_1)
          L19_1.WriteSize = L20_1
          L17_1(L18_1, L19_1)
          L6_1 = L6_1 + 1
        end
      end
    end
    if 5 <= L6_1 then
      L14_1 = {}
      L14_1.gen_ransom_data = L5_1
      L15_1 = safeJsonSerialize
      L16_1 = L14_1
      L15_1 = L15_1(L16_1)
      L16_1 = bm
      L16_1 = L16_1.add_related_string
      L17_1 = "genfb_ransom_meta"
      L18_1 = L15_1
      L19_1 = bm
      L19_1 = L19_1.RelatedStringBMReport
      L16_1(L17_1, L18_1, L19_1)
      L16_1 = bm
      L16_1 = L16_1.trigger_sig
      L17_1 = "GenericRansomware:FileAppendBucket1:16"
      L18_1 = L15_1
      L16_1(L17_1, L18_1)
      L16_1 = mp
      L16_1 = L16_1.INFECTED
      return L16_1
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
