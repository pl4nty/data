local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1
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
            if 5 < L8_1 then
              L12_1 = L8_1 - 5
              if L12_1 then
                goto lbl_60
              end
            end
            L12_1 = 1
            ::lbl_60::
            L13_1 = L12_1 + 10
            if L0_1 < L13_1 then
              L13_1 = L12_1 + 10
              if L13_1 then
                goto lbl_67
              end
            end
            L13_1 = L0_1
            ::lbl_67::
            L14_1 = L12_1
            L15_1 = L13_1
            L16_1 = 1
            for L17_1 = L14_1, L15_1, L16_1 do
              L18_1 = sigattr_tail
              L18_1 = L18_1[L17_1]
              L18_1 = L18_1.attribute
              if L18_1 == 16525 then
                L18_1 = sigattr_tail
                L18_1 = L18_1[L8_1]
                L18_1 = L18_1.utf8p1
                L19_1 = sigattr_tail
                L19_1 = L19_1[L17_1]
                L19_1 = L19_1.utf8p1
                if L18_1 == L19_1 then
                  L18_1 = {}
                  L19_1 = L1_1[L10_1]
                  if L19_1 == nil then
                    L1_1[L10_1] = L8_1
                    L19_1 = string
                    L19_1 = L19_1.gmatch
                    L20_1 = L9_1
                    L21_1 = "(%w+):(%w+)"
                    L19_1, L20_1, L21_1 = L19_1(L20_1, L21_1)
                    for L22_1, L23_1 in L19_1, L20_1, L21_1 do
                      L18_1[L22_1] = L23_1
                    end
                    L19_1 = L18_1.TotalSizeAppend
                    if L19_1 then
                      L19_1 = tonumber
                      L20_1 = L18_1.TotalSizeAppend
                      L19_1 = L19_1(L20_1)
                      if L19_1 then
                        goto lbl_107
                      end
                    end
                    L19_1 = 0
                    ::lbl_107::
                    if 0 < L19_1 then
                      if 16 < L19_1 then
                        L4_1 = L4_1 + 1
                      end
                      L20_1 = L18_1.LastOff
                      if L20_1 then
                        L20_1 = tonumber
                        L21_1 = L18_1.LastOff
                        L20_1 = L20_1(L21_1)
                        if L20_1 then
                          goto lbl_121
                        end
                      end
                      L20_1 = 0
                      ::lbl_121::
                      L21_1 = L18_1.FirstOff
                      if L21_1 then
                        L21_1 = tonumber
                        L22_1 = L18_1.FirstOff
                        L21_1 = L21_1(L22_1)
                        if L21_1 then
                          goto lbl_130
                        end
                      end
                      L21_1 = 0
                      ::lbl_130::
                      L22_1 = L18_1.NumWrites
                      if L22_1 then
                        L22_1 = tonumber
                        L23_1 = L18_1.NumWrites
                        L22_1 = L22_1(L23_1)
                        if L22_1 then
                          goto lbl_139
                        end
                      end
                      L22_1 = 0
                      ::lbl_139::
                      L23_1 = L18_1.BiggestOff
                      if L23_1 then
                        L23_1 = tonumber
                        L24_1 = L18_1.BiggestOff
                        L23_1 = L23_1(L24_1)
                        if L23_1 then
                          goto lbl_148
                        end
                      end
                      L23_1 = 0
                      ::lbl_148::
                      L24_1 = L18_1.SmallestOff
                      if L24_1 then
                        L24_1 = tonumber
                        L25_1 = L18_1.SmallestOff
                        L24_1 = L24_1(L25_1)
                        if L24_1 then
                          goto lbl_157
                        end
                      end
                      L24_1 = 0
                      ::lbl_157::
                      L25_1 = L18_1.TotalSizeWrite
                      if L25_1 then
                        L25_1 = tonumber
                        L26_1 = L18_1.TotalSizeWrite
                        L25_1 = L25_1(L26_1)
                        if L25_1 then
                          goto lbl_166
                        end
                      end
                      L25_1 = 0
                      ::lbl_166::
                      if L23_1 ~= 0 and L21_1 == 0 and L24_1 == 0 and L23_1 == L20_1 then
                        L26_1 = L20_1 + 1
                        if L26_1 == L25_1 and 0 < L22_1 and 0 < L19_1 and L19_1 <= 16 then
                          if 10 <= L3_1 then
                            break
                          elseif L3_1 < 10 then
                            L18_1.path = L10_1
                            L2_1[L8_1] = L18_1
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
        L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L17_1(L18_1, L19_1, L20_1)
        L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
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
