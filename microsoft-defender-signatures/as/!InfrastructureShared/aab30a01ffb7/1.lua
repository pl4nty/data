local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = 0
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = {}
    L3_1 = 1
    L4_1 = L0_1
    L5_1 = 1
    for L6_1 = L3_1, L4_1, L5_1 do
      L7_1 = sigattr_tail
      L7_1 = L7_1[L6_1]
      L7_1 = L7_1.attribute
      if L7_1 == 16387 then
        L7_1 = sigattr_tail
        L7_1 = L7_1[L6_1]
        L7_1 = L7_1.utf8p1
        if L7_1 then
          L7_1 = sigattr_tail
          L7_1 = L7_1[L6_1]
          L7_1 = L7_1.utf8p1
          L8_1 = L7_1
          L7_1 = L7_1.lower
          L7_1 = L7_1(L8_1)
          L2_1[L7_1] = L6_1
          L1_1 = L1_1 + 1
        end
      end
    end
    L3_1 = {}
    if 5 <= L1_1 then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[1]
      L4_1 = L4_1.utf8p2
      if L4_1 then
        L4_1 = {}
        L5_1 = safeJsonDeserialize
        L6_1 = this_sigattrlog
        L6_1 = L6_1[1]
        L6_1 = L6_1.utf8p2
        L5_1 = L5_1(L6_1)
        L6_1 = pairs
        L7_1 = L5_1.file_list
        L6_1, L7_1, L8_1 = L6_1(L7_1)
        for L9_1, L10_1 in L6_1, L7_1, L8_1 do
          L11_1 = pairs
          L12_1 = L2_1
          L11_1, L12_1, L13_1 = L11_1(L12_1)
          for L14_1, L15_1 in L11_1, L12_1, L13_1 do
            L16_1 = #L10_1
            L17_1 = #L14_1
            if L16_1 > L17_1 then
              L17_1 = L10_1
              L16_1 = L10_1.find
              L18_1 = L14_1
              L19_1 = 1
              L20_1 = true
              L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
              if L16_1 == 1 then
                L17_1 = L10_1
                L16_1 = L10_1.byte
                L18_1 = #L14_1
                L18_1 = L18_1 + 1
                L16_1 = L16_1(L17_1, L18_1)
                if L16_1 ~= 58 then
                  L16_1 = string
                  L16_1 = L16_1.sub
                  L17_1 = L10_1
                  L18_1 = #L14_1
                  L18_1 = L18_1 + 1
                  L16_1 = L16_1(L17_1, L18_1)
                  L18_1 = L16_1
                  L17_1 = L16_1.find
                  L19_1 = "\\"
                  L20_1 = 1
                  L21_1 = true
                  L17_1 = L17_1(L18_1, L19_1, L20_1, L21_1)
                  if L17_1 == nil then
                    L17_1 = L3_1[L16_1]
                    if L17_1 ~= nil then
                      L17_1 = table
                      L17_1 = L17_1.insert
                      L18_1 = L3_1[L16_1]
                      L19_1 = L15_1
                      L17_1(L18_1, L19_1)
                    else
                      L17_1 = {}
                      L18_1 = L15_1
                      L17_1[1] = L18_1
                      L3_1[L16_1] = L17_1
                    end
                    L17_1 = L3_1[L16_1]
                    L17_1 = #L17_1
                    if 3 <= L17_1 then
                      L17_1 = pairs
                      L18_1 = L3_1[L16_1]
                      L17_1, L18_1, L19_1 = L17_1(L18_1)
                      for L20_1, L21_1 in L17_1, L18_1, L19_1 do
                        L22_1 = table
                        L22_1 = L22_1.insert
                        L23_1 = L4_1
                        L24_1 = sigattr_tail
                        L24_1 = L24_1[L21_1]
                        L24_1 = L24_1.utf8p1
                        L22_1(L23_1, L24_1)
                      end
                      L17_1 = {}
                      L17_1.appended_ext = L16_1
                      L17_1.encrypted_file_meta = L4_1
                      L18_1 = bm
                      L18_1 = L18_1.trigger_sig
                      L19_1 = "GenericRansomware:Type4.2"
                      L20_1 = safeJsonSerialize
                      L21_1 = L17_1
                      L20_1, L21_1, L22_1, L23_1, L24_1 = L20_1(L21_1)
                      L18_1(L19_1, L20_1, L21_1, L22_1, L23_1, L24_1)
                      L18_1 = mp
                      L18_1 = L18_1.INFECTED
                      return L18_1
                    end
                  end
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
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
