local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1
L0_1 = 4
L1_1 = 1
L2_1 = nil
L3_1 = {}
L4_1 = nil
L5_1 = mp
L5_1 = L5_1.SIGATTR_LOG_SZ
L6_1 = 1
L7_1 = L5_1
L8_1 = 1
for L9_1 = L6_1, L7_1, L8_1 do
  L10_1 = sigattr_tail
  L10_1 = L10_1[L9_1]
  L10_1 = L10_1.attribute
  if L10_1 == 16491 then
    L10_1 = sigattr_tail
    L10_1 = L10_1[L9_1]
    L10_1 = L10_1.utf8p1
    if L10_1 == "GenericRansomware:Type4" then
      L10_1 = sigattr_tail
      L10_1 = L10_1[L9_1]
      L10_1 = L10_1.utf8p2
      if L10_1 ~= nil then
        L10_1 = safeJsonDeserialize
        L11_1 = sigattr_tail
        L11_1 = L11_1[L9_1]
        L11_1 = L11_1.utf8p2
        L10_1 = L10_1(L11_1)
        L2_1 = L10_1
        if L2_1 then
          L4_1 = L2_1.appended_ext
          break
        end
      end
    end
  end
end
L6_1 = 0
L7_1 = 0
L8_1 = {}
L9_1 = {}
if L4_1 ~= nil then
  L10_1 = 1
  L11_1 = L5_1
  L12_1 = 1
  for L13_1 = L10_1, L11_1, L12_1 do
    L14_1 = sigattr_tail
    L14_1 = L14_1[L13_1]
    L14_1 = L14_1.attribute
    if L14_1 == 16384 then
      L14_1 = sigattr_tail
      L14_1 = L14_1[L13_1]
      L14_1 = L14_1.utf8p1
      if L14_1 then
        L14_1 = sigattr_tail
        L14_1 = L14_1[L13_1]
        L14_1 = L14_1.utf8p1
        L15_1 = L14_1
        L14_1 = L14_1.byte
        L16_1 = 1
        L14_1 = L14_1(L15_1, L16_1)
        if L14_1 ~= 37 then
          L14_1 = sigattr_tail
          L14_1 = L14_1[L13_1]
          L14_1 = L14_1.utf8p1
          L15_1 = L14_1
          L14_1 = L14_1.lower
          L14_1 = L14_1(L15_1)
          L16_1 = L14_1
          L15_1 = L14_1.match
          L17_1 = "[^\\]+$"
          L15_1 = L15_1(L16_1, L17_1)
          L17_1 = L15_1
          L16_1 = L15_1.match
          L18_1 = "%.[^%.]+$"
          L16_1 = L16_1(L17_1, L18_1)
          if L16_1 and L16_1 == L4_1 then
            L17_1 = L3_1[L14_1]
            if L17_1 == nil then
              L17_1 = string
              L17_1 = L17_1.sub
              L18_1 = L15_1
              L19_1 = 1
              L20_1 = string
              L20_1 = L20_1.len
              L21_1 = L15_1
              L20_1 = L20_1(L21_1)
              L21_1 = string
              L21_1 = L21_1.len
              L22_1 = L16_1
              L21_1 = L21_1(L22_1)
              L20_1 = L20_1 - L21_1
              L17_1 = L17_1(L18_1, L19_1, L20_1)
              L19_1 = L17_1
              L18_1 = L17_1.match
              L20_1 = "%.[^%.]+$"
              L18_1 = L18_1(L19_1, L20_1)
              if L18_1 then
                L19_1 = L9_1[L18_1]
                if L19_1 == nil then
                  L19_1 = mp
                  L19_1 = L19_1.GetExtensionClass
                  L20_1 = L16_1
                  L19_1 = L19_1(L20_1)
                  if L19_1 == 0 then
                    L19_1 = mp
                    L19_1 = L19_1.GetExtensionClass
                    L20_1 = L18_1
                    L19_1 = L19_1(L20_1)
                    if L19_1 ~= 255 then
                      L19_1 = mp
                      L19_1 = L19_1.GetExtensionClass
                      L20_1 = L18_1
                      L19_1 = L19_1(L20_1)
                      if L19_1 ~= 2 then
                        L19_1 = mp
                        L19_1 = L19_1.GetExtensionClass
                        L20_1 = L18_1
                        L19_1 = L19_1(L20_1)
                        if L19_1 ~= 3 then
                          goto lbl_132
                        end
                      end
                    end
                    L9_1[L18_1] = L13_1
                    L7_1 = L7_1 + 1
                  end
                end
              end
              ::lbl_132::
              L20_1 = L14_1
              L19_1 = L14_1.match
              L21_1 = "^(.+)\\"
              L19_1 = L19_1(L20_1, L21_1)
              if L19_1 then
                L20_1 = L8_1[L19_1]
                if L20_1 == nil then
                  L8_1[L19_1] = L13_1
                  L6_1 = L6_1 + 1
                end
              end
              if L0_1 <= L7_1 and L1_1 <= L6_1 then
                L20_1 = {}
                L21_1 = {}
                L22_1 = pairs
                L23_1 = L9_1
                L22_1, L23_1, L24_1 = L22_1(L23_1)
                for L25_1, L26_1 in L22_1, L23_1, L24_1 do
                  L27_1 = table
                  L27_1 = L27_1.insert
                  L28_1 = L20_1
                  L29_1 = L25_1
                  L27_1(L28_1, L29_1)
                end
                L22_1 = pairs
                L23_1 = L8_1
                L22_1, L23_1, L24_1 = L22_1(L23_1)
                for L25_1, L26_1 in L22_1, L23_1, L24_1 do
                  L27_1 = table
                  L27_1 = L27_1.insert
                  L28_1 = L21_1
                  L29_1 = L25_1
                  L27_1(L28_1, L29_1)
                end
                L22_1 = {}
                L22_1.ext_list = L20_1
                L22_1.dir_list = L21_1
                L22_1.enc_meta = L2_1
                L23_1 = safeJsonSerialize
                L24_1 = L22_1
                L23_1 = L23_1(L24_1)
                L24_1 = bm
                L24_1 = L24_1.add_related_string
                L25_1 = "gendfc_ransom_meta"
                L26_1 = L23_1
                L27_1 = bm
                L27_1 = L27_1.RelatedStringBMReport
                L24_1(L25_1, L26_1, L27_1)
                L24_1 = mp
                L24_1 = L24_1.INFECTED
                return L24_1
              end
              L3_1[L14_1] = L13_1
            end
          end
        end
      end
    end
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
