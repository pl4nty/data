local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = 4
L3_1 = 0
L4_1 = this_sigattrlog
L4_1 = L4_1[13]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[13]
  L4_1 = L4_1.utf8p2
  if L4_1 then
    L4_1 = safeJsonDeserialize
    L5_1 = this_sigattrlog
    L5_1 = L5_1[13]
    L5_1 = L5_1.utf8p2
    L4_1 = L4_1(L5_1)
    L5_1 = {}
    L6_1 = tonumber
    L7_1 = L4_1.append_size
    L6_1 = L6_1(L7_1)
    if L6_1 == 92 then
      L6_1 = 1
      L7_1 = L0_1
      L8_1 = 1
      for L9_1 = L6_1, L7_1, L8_1 do
        L10_1 = sigattr_tail
        L10_1 = L10_1[L9_1]
        L10_1 = L10_1.utf8p2
        L11_1 = sigattr_tail
        L11_1 = L11_1[L9_1]
        L11_1 = L11_1.attribute
        if L11_1 == 16385 then
          L11_1 = string
          L11_1 = L11_1.len
          L12_1 = sigattr_tail
          L12_1 = L12_1[L9_1]
          L12_1 = L12_1.utf8p1
          L11_1 = L11_1(L12_1)
          if 5 < L11_1 then
            L11_1 = sigattr_tail
            L11_1 = L11_1[L9_1]
            L11_1 = L11_1.utf8p1
            L12_1 = L11_1
            L11_1 = L11_1.byte
            L13_1 = 1
            L11_1 = L11_1(L12_1, L13_1)
            if L11_1 ~= 37 then
              L11_1 = sigattr_tail
              L11_1 = L11_1[L9_1]
              L11_1 = L11_1.utf8p1
              L12_1 = L11_1
              L11_1 = L11_1.lower
              L11_1 = L11_1(L12_1)
              L12_1 = {}
              L13_1 = L1_1[L11_1]
              if L13_1 == nil then
                L1_1[L11_1] = L9_1
                L13_1 = string
                L13_1 = L13_1.gmatch
                L14_1 = L10_1
                L15_1 = "(%w+):(%w+)"
                L13_1, L14_1, L15_1 = L13_1(L14_1, L15_1)
                for L16_1, L17_1 in L13_1, L14_1, L15_1 do
                  L12_1[L16_1] = L17_1
                end
                L13_1 = L12_1.LastOff
                if L13_1 then
                  L13_1 = tonumber
                  L14_1 = L12_1.LastOff
                  L13_1 = L13_1(L14_1)
                  if L13_1 then
                    goto lbl_83
                  end
                end
                L13_1 = 0
                ::lbl_83::
                L14_1 = L12_1.FirstOff
                if L14_1 then
                  L14_1 = tonumber
                  L15_1 = L12_1.FirstOff
                  L14_1 = L14_1(L15_1)
                  if L14_1 then
                    goto lbl_92
                  end
                end
                L14_1 = 0
                ::lbl_92::
                L15_1 = L12_1.NumWrites
                if L15_1 then
                  L15_1 = tonumber
                  L16_1 = L12_1.NumWrites
                  L15_1 = L15_1(L16_1)
                  if L15_1 then
                    goto lbl_101
                  end
                end
                L15_1 = 0
                ::lbl_101::
                L16_1 = L12_1.BiggestOff
                if L16_1 then
                  L16_1 = tonumber
                  L17_1 = L12_1.BiggestOff
                  L16_1 = L16_1(L17_1)
                  if L16_1 then
                    goto lbl_110
                  end
                end
                L16_1 = 0
                ::lbl_110::
                L17_1 = L12_1.SmallestOff
                if L17_1 then
                  L17_1 = tonumber
                  L18_1 = L12_1.SmallestOff
                  L17_1 = L17_1(L18_1)
                  if L17_1 then
                    goto lbl_119
                  end
                end
                L17_1 = 0
                ::lbl_119::
                L18_1 = L13_1 + 1
                if L14_1 ~= L18_1 then
                  L18_1 = L13_1 + 2
                end
                if L14_1 == L18_1 and L17_1 == 0 then
                  L18_1 = L13_1 + 92
                  if L16_1 ~= L18_1 then
                    L18_1 = L13_1 + 93
                  end
                  if L16_1 == L18_1 and L15_1 < 10 and 256 < L16_1 then
                    L18_1 = sysio
                    L18_1 = L18_1.ReadFile
                    L19_1 = sigattr_tail
                    L19_1 = L19_1[L9_1]
                    L19_1 = L19_1.utf8p1
                    L20_1 = 0
                    L21_1 = 256
                    L18_1 = L18_1(L19_1, L20_1, L21_1)
                    if L18_1 ~= nil then
                      L19_1 = string
                      L19_1 = L19_1.format
                      L20_1 = "0x%02X%02X%02X%02X"
                      L21_1 = string
                      L21_1 = L21_1.byte
                      L22_1 = L18_1
                      L23_1 = 1
                      L24_1 = 4
                      L21_1, L22_1, L23_1, L24_1, L25_1 = L21_1(L22_1, L23_1, L24_1)
                      L19_1 = L19_1(L20_1, L21_1, L22_1, L23_1, L24_1, L25_1)
                      L20_1 = crypto
                      L20_1 = L20_1.ComputeEntropy
                      L21_1 = L18_1
                      L20_1 = L20_1(L21_1)
                      if 7 <= L20_1 then
                        L21_1 = table
                        L21_1 = L21_1.insert
                        L22_1 = L5_1
                        L23_1 = {}
                        L24_1 = sigattr_tail
                        L24_1 = L24_1[L9_1]
                        L24_1 = L24_1.utf8p1
                        L23_1.path = L24_1
                        L23_1.magic = L19_1
                        L23_1.entropy = L20_1
                        L21_1(L22_1, L23_1)
                        L3_1 = L3_1 + 1
                        if L2_1 <= L3_1 then
                          L21_1 = {}
                          L22_1 = L4_1.append_size
                          L21_1.append_size = L22_1
                          L21_1.file_paths = L5_1
                          L22_1 = bm
                          L22_1 = L22_1.add_related_string
                          L23_1 = "genfa_lockbit4_meta"
                          L24_1 = safeJsonSerialize
                          L25_1 = L21_1
                          L24_1 = L24_1(L25_1)
                          L25_1 = bm
                          L25_1 = L25_1.RelatedStringBMReport
                          L22_1(L23_1, L24_1, L25_1)
                          L22_1 = sms_untrusted_process
                          L22_1()
                          L22_1 = mp
                          L22_1 = L22_1.INFECTED
                          return L22_1
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
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
