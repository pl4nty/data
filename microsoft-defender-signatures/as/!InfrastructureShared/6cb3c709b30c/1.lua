local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    L0_1 = safeJsonDeserialize
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p2
    L0_1 = L0_1(L1_1)
    if L0_1 then
      L1_1 = L0_1.gen_ransom_data
      if L1_1 then
        L1_1 = 0
        L2_1 = pairs
        L3_1 = L0_1.gen_ransom_data
        L2_1, L3_1, L4_1 = L2_1(L3_1)
        for L5_1, L6_1 in L2_1, L3_1, L4_1 do
          L7_1 = L0_1.gen_ransom_data
          L7_1 = L7_1[L5_1]
          L7_1 = L7_1.Entropy
          if not (L7_1 < 7) then
            L7_1 = tonumber
            L8_1 = L0_1.gen_ransom_data
            L8_1 = L8_1[L5_1]
            L8_1 = L8_1.Filesize
            L7_1 = L7_1(L8_1)
            L8_1 = tonumber
            L9_1 = L0_1.gen_ransom_data
            L9_1 = L9_1[L5_1]
            L9_1 = L9_1.WriteSize
            L8_1 = L8_1(L9_1)
            if L7_1 == L8_1 then
              L7_1 = tonumber
              L8_1 = L0_1.gen_ransom_data
              L8_1 = L8_1[L5_1]
              L8_1 = L8_1.Filesize
              L7_1 = L7_1(L8_1)
              L7_1 = L7_1 % 16
              if L7_1 == 0 then
                goto lbl_54
              end
            end
          end
          L7_1 = mp
          L7_1 = L7_1.CLEAN
          do return L7_1 end
          ::lbl_54::
          L7_1 = L0_1.gen_ransom_data
          L7_1 = L7_1[L5_1]
          L7_1 = L7_1.FilePath
          L8_1 = L7_1
          L7_1 = L7_1.match
          L9_1 = "%.[^%.]+$"
          L7_1 = L7_1(L8_1, L9_1)
          L8_1 = ExtensionToMagicMismatch
          L9_1 = L7_1
          L10_1 = L0_1.gen_ransom_data
          L10_1 = L10_1[L5_1]
          L10_1 = L10_1.MagicByte
          L8_1 = L8_1(L9_1, L10_1)
          if L8_1 ~= nil and L8_1 == false then
            L9_1 = mp
            L9_1 = L9_1.CLEAN
            return L9_1
          end
          L1_1 = L1_1 + 1
        end
        if 5 <= L1_1 then
          L2_1 = safeJsonSerialize
          L3_1 = L0_1
          L2_1 = L2_1(L3_1)
          L3_1 = bm
          L3_1 = L3_1.add_related_string
          L4_1 = "ransom_meta"
          L5_1 = L2_1
          L6_1 = bm
          L6_1 = L6_1.RelatedStringBMReport
          L3_1(L4_1, L5_1, L6_1)
          L3_1 = bm
          L3_1 = L3_1.trigger_sig
          L4_1 = "GenericRansomware:Type7"
          L5_1 = L2_1
          L3_1(L4_1, L5_1)
          L3_1 = sms_untrusted_process
          L3_1()
          L3_1 = mp
          L3_1 = L3_1.INFECTED
          return L3_1
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
