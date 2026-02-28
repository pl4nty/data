local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
if L0_1 then
  L2_1 = ipairs
  L3_1 = L0_1
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = L6_1.ppid
    if L7_1 then
      L7_1 = L6_1.image_path
      if L7_1 then
        L7_1 = string
        L7_1 = L7_1.lower
        L8_1 = L6_1.image_path
        L7_1 = L7_1(L8_1)
        L8_1 = string
        L8_1 = L8_1.find
        L9_1 = L7_1
        L10_1 = "w3wp"
        L11_1 = 1
        L12_1 = true
        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
        if L8_1 then
          L8_1 = mp
          L8_1 = L8_1.bitand
          L9_1 = L6_1.reason_ex
          L10_1 = 1
          L8_1 = L8_1(L9_1, L10_1)
          if L8_1 == 1 then
            L8_1 = bm
            L8_1 = L8_1.add_related_string
            L9_1 = "Recent_Threats"
            L10_1 = GetRollingQueueAsHashTable
            L11_1 = "RecentThreatsOnMachine"
            L10_1 = L10_1(L11_1)
            L11_1 = bm
            L11_1 = L11_1.RelatedStringBMReport
            L8_1(L9_1, L10_1, L11_1)
            L8_1 = mp
            L8_1 = L8_1.INFECTED
            return L8_1
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
