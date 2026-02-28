local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.utf8p1
    if L0_1 ~= nil then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[3]
      L0_1 = L0_1.utf8p2
      if L0_1 ~= nil then
        L0_1 = string
        L0_1 = L0_1.lower
        L1_1 = this_sigattrlog
        L1_1 = L1_1[2]
        L1_1 = L1_1.utf8p1
        L0_1 = L0_1(L1_1)
        L1_1 = string
        L1_1 = L1_1.lower
        L2_1 = this_sigattrlog
        L2_1 = L2_1[3]
        L2_1 = L2_1.utf8p2
        L1_1 = L1_1(L2_1)
        L3_1 = L0_1
        L2_1 = L0_1.match
        L4_1 = "\\([^\\]+)$"
        L2_1 = L2_1(L3_1, L4_1)
        if L2_1 ~= nil then
          L4_1 = L1_1
          L3_1 = L1_1.find
          L5_1 = L2_1
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if L3_1 then
            L3_1 = TrackPidAndTechniqueBM
            L4_1 = "BM"
            L5_1 = "T1220"
            L6_1 = "xsl_file_drop_and_exec:"
            L7_1 = L2_1
            L6_1 = L6_1 .. L7_1
            L3_1(L4_1, L5_1, L6_1)
            L3_1 = mp
            L3_1 = L3_1.INFECTED
            return L3_1
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
