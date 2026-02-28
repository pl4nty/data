local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.utf8p1
    if L0_1 then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[3]
      L0_1 = L0_1.utf8p1
      if L0_1 then
        L0_1 = this_sigattrlog
        L0_1 = L0_1[1]
        L0_1 = L0_1.utf8p1
        L2_1 = L0_1
        L1_1 = L0_1.match
        L3_1 = "[^\\]+$"
        L1_1 = L1_1(L2_1, L3_1)
        L2_1 = this_sigattrlog
        L2_1 = L2_1[3]
        L2_1 = L2_1.utf8p1
        L4_1 = L2_1
        L3_1 = L2_1.match
        L5_1 = "[^\\]+$"
        L3_1 = L3_1(L4_1, L5_1)
        if L0_1 and L3_1 then
          L5_1 = L1_1
          L4_1 = L1_1.match
          L6_1 = "(.+)%.ico+"
          L4_1 = L4_1(L5_1, L6_1)
          L5_1 = L4_1
          L4_1 = L4_1.lower
          L4_1 = L4_1(L5_1)
          L6_1 = L3_1
          L5_1 = L3_1.match
          L7_1 = "(.+)%.README.txt+"
          L5_1 = L5_1(L6_1, L7_1)
          L6_1 = L5_1
          L5_1 = L5_1.lower
          L5_1 = L5_1(L6_1)
          if L4_1 and L5_1 and L4_1 == L5_1 then
            L6_1 = reportTimingData
            L6_1()
            L6_1 = sms_untrusted_process
            L6_1()
            L6_1 = mp
            L6_1 = L6_1.INFECTED
            return L6_1
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
