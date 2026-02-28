local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.utf8p1
    if L0_1 ~= "" then
      L0_1 = string
      L0_1 = L0_1.match
      L1_1 = this_sigattrlog
      L1_1 = L1_1[1]
      L1_1 = L1_1.utf8p1
      L2_1 = "/%.[^/]+$"
      L0_1 = L0_1(L1_1, L2_1)
      if L0_1 then
        L0_1 = bm
        L0_1 = L0_1.trigger_sig
        L1_1 = "HiddenParent"
        L2_1 = this_sigattrlog
        L2_1 = L2_1[1]
        L2_1 = L2_1.utf8p1
        L0_1(L1_1, L2_1)
        L0_1 = bm
        L0_1 = L0_1.get_process_relationships
        L0_1, L1_1 = L0_1()
        L2_1 = ipairs
        L3_1 = L1_1
        L2_1, L3_1, L4_1 = L2_1(L3_1)
        for L5_1, L6_1 in L2_1, L3_1, L4_1 do
          L7_1 = bm
          L7_1 = L7_1.trigger_sig
          L8_1 = "HiddenParent"
          L9_1 = this_sigattrlog
          L9_1 = L9_1[1]
          L9_1 = L9_1.utf8p1
          L10_1 = L6_1.ppid
          L7_1(L8_1, L9_1, L10_1)
        end
        L2_1 = mp
        L2_1 = L2_1.INFECTED
        return L2_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
