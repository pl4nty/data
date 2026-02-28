local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = pcall
L1_1 = bm
L1_1 = L1_1.GetMemQueryCount
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1()
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
if L1_1 ~= nil and 0 < L1_1 then
  L2_1 = nil
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= nil then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[3]
      L3_1 = L3_1.utf8p2
      if L3_1 ~= nil then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[3]
        L2_1 = L3_1.utf8p2
        L3_1 = bm
        L3_1 = L3_1.add_related_string
        L4_1 = "MQp2"
        L5_1 = L2_1
        L6_1 = bm
        L6_1 = L6_1.RelatedStringBMReport
        L3_1(L4_1, L5_1, L6_1)
        L3_1 = bm
        L3_1 = L3_1.get_current_process_startup_info
        L3_1 = L3_1()
        if L3_1 ~= nil then
          L4_1 = L3_1.ppid
          if L4_1 ~= nil then
            L4_1 = AddResearchData
            L5_1 = L3_1.ppid
            L6_1 = true
            L4_1(L5_1, L6_1)
          end
        end
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        return L4_1
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
