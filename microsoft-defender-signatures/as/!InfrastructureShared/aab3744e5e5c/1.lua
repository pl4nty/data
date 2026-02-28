local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
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
        L8_1 = L7_1
        L7_1 = L7_1.lower
        L7_1 = L7_1(L8_1)
        L2_1[L7_1] = L6_1
        L1_1 = L1_1 + 1
      end
    end
    if 5 <= L1_1 then
      L3_1 = {}
      L4_1 = safeJsonDeserialize
      L5_1 = this_sigattrlog
      L5_1 = L5_1[1]
      L5_1 = L5_1.utf8p2
      L4_1 = L4_1(L5_1)
      L5_1 = string
      L5_1 = L5_1.len
      L6_1 = L4_1.appended_ext
      L5_1 = L5_1(L6_1)
      L6_1 = ipairs
      L7_1 = L4_1.file_list
      L6_1, L7_1, L8_1 = L6_1(L7_1)
      for L9_1, L10_1 in L6_1, L7_1, L8_1 do
        L11_1 = string
        L11_1 = L11_1.len
        L12_1 = L10_1.path
        L11_1 = L11_1(L12_1)
        if L5_1 < L11_1 then
          L12_1 = string
          L12_1 = L12_1.sub
          L13_1 = L10_1.path
          L14_1 = 1
          L15_1 = L11_1 - L5_1
          L12_1 = L12_1(L13_1, L14_1, L15_1)
          L13_1 = L2_1[L12_1]
          if L13_1 ~= nil then
            L13_1 = table
            L13_1 = L13_1.insert
            L14_1 = L3_1
            L15_1 = L10_1.path
            L13_1(L14_1, L15_1)
          end
          L13_1 = #L3_1
          if 4 <= L13_1 then
            L13_1 = {}
            L14_1 = L4_1.appended_ext
            L13_1.appended_ext = L14_1
            L13_1.encrypted_file_meta = L3_1
            L14_1 = bm
            L14_1 = L14_1.trigger_sig
            L15_1 = "GenericRansomware:Type4.2"
            L16_1 = safeJsonSerialize
            L17_1 = L13_1
            L16_1, L17_1 = L16_1(L17_1)
            L14_1(L15_1, L16_1, L17_1)
            L14_1 = bm
            L14_1 = L14_1.add_related_string
            L15_1 = "genda_delete_ransom_meta"
            L16_1 = safeJsonSerialize
            L17_1 = L13_1
            L16_1 = L16_1(L17_1)
            L17_1 = bm
            L17_1 = L17_1.RelatedStringBMReport
            L14_1(L15_1, L16_1, L17_1)
            L14_1 = mp
            L14_1 = L14_1.INFECTED
            return L14_1
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
