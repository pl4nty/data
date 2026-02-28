local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    L0_1 = {}
    L1_1 = safeJsonDeserialize
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L2_1 = isnull
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if not L2_1 then
      L2_1 = 1
      L3_1 = L1_1.file_paths
      L3_1 = #L3_1
      L4_1 = 1
      for L5_1 = L2_1, L3_1, L4_1 do
        L6_1 = L1_1.file_paths
        L6_1 = L6_1[L5_1]
        L6_1 = L6_1.path
        L7_1 = L1_1.file_paths
        L7_1 = L7_1[L5_1]
        L7_1 = L7_1.renamed_path
        L8_1 = isnull
        L9_1 = L6_1
        L8_1 = L8_1(L9_1)
        if not L8_1 then
          L8_1 = isnull
          L9_1 = L7_1
          L8_1 = L8_1(L9_1)
          if not L8_1 then
            L9_1 = L6_1
            L8_1 = L6_1.match
            L10_1 = "[^\\]+$"
            L8_1 = L8_1(L9_1, L10_1)
            L10_1 = L7_1
            L9_1 = L7_1.match
            L11_1 = "[^\\]+$"
            L9_1 = L9_1(L10_1, L11_1)
            L11_1 = L9_1
            L10_1 = L9_1.match
            L12_1 = "(.+)%..+"
            L10_1 = L10_1(L11_1, L12_1)
            L11_1 = L10_1
            L10_1 = L10_1.lower
            L10_1 = L10_1(L11_1)
            L12_1 = L8_1
            L11_1 = L8_1.match
            L13_1 = "(.+)%..+"
            L11_1 = L11_1(L12_1, L13_1)
            L12_1 = L11_1
            L11_1 = L11_1.lower
            L11_1 = L11_1(L12_1)
            if L10_1 == L11_1 then
              L13_1 = L7_1
              L12_1 = L7_1.match
              L14_1 = "%.[^%.]+$"
              L12_1 = L12_1(L13_1, L14_1)
              L13_1 = L12_1
              L12_1 = L12_1.lower
              L12_1 = L12_1(L13_1)
              if L12_1 then
                L13_1 = mp
                L13_1 = L13_1.GetExtensionClass
                L14_1 = L12_1
                L13_1 = L13_1(L14_1)
                if L13_1 == 0 then
                  L13_1 = L0_1[L12_1]
                  if L13_1 ~= nil then
                    L13_1 = table
                    L13_1 = L13_1.insert
                    L14_1 = L0_1[L12_1]
                    L15_1 = 1
                    L13_1(L14_1, L15_1)
                  else
                    L13_1 = {}
                    L14_1 = 1
                    L13_1[1] = L14_1
                    L0_1[L12_1] = L13_1
                  end
                  L13_1 = sysio
                  L13_1 = L13_1.GetFileSize
                  L14_1 = L7_1
                  L13_1 = L13_1(L14_1)
                  L14_1 = sysio
                  L14_1 = L14_1.ReadFile
                  L15_1 = L7_1
                  L16_1 = 0
                  L17_1 = 4
                  L14_1 = L14_1(L15_1, L16_1, L17_1)
                  L15_1 = L1_1.file_paths
                  L15_1 = L15_1[L5_1]
                  L15_1.fileSize = L13_1
                  L15_1 = L1_1.file_paths
                  L15_1 = L15_1[L5_1]
                  L15_1.magic = L14_1
                end
              end
            end
          end
        end
      end
    end
    L2_1 = pairs
    L3_1 = L0_1
    L2_1, L3_1, L4_1 = L2_1(L3_1)
    for L5_1, L6_1 in L2_1, L3_1, L4_1 do
      L7_1 = L0_1[L5_1]
      L7_1 = #L7_1
      if 4 <= L7_1 then
        L1_1.rename_ext = L5_1
        L7_1 = safeJsonSerialize
        L8_1 = L1_1
        L7_1 = L7_1(L8_1)
        L8_1 = bm
        L8_1 = L8_1.add_related_string
        L9_1 = "genrn_ransom_meta"
        L10_1 = L7_1
        L11_1 = bm
        L11_1 = L11_1.RelatedStringBMReport
        L8_1(L9_1, L10_1, L11_1)
        L8_1 = bm
        L8_1 = L8_1.trigger_sig
        L9_1 = "GenericRansomware:ReplaceExtension"
        L10_1 = L7_1
        L8_1(L9_1, L10_1)
        L8_1 = mp
        L8_1 = L8_1.INFECTED
        return L8_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
