local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = pe
L0_1 = L0_1.get_postemu_sigattr_log_head_size
L0_1 = L0_1()
L1_1 = 1
L2_1 = L0_1
L3_1 = 1
for L4_1 = L1_1, L2_1, L3_1 do
  L5_1 = pe
  L5_1 = L5_1.get_postemu_sigattr_log_head
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  L6_1 = L5_1.attribute
  if L6_1 == 12296 then
    L6_1 = L5_1.p1
    if L6_1 ~= nil then
      L6_1 = L5_1.p1
      L6_1 = #L6_1
      if 0 < L6_1 then
        L6_1 = L5_1.p1
        L6_1 = #L6_1
        if L6_1 < 260 then
          L6_1 = sysio
          L6_1 = L6_1.IsFileExists
          L7_1 = L5_1.p1
          L6_1 = L6_1(L7_1)
          if L6_1 then
            L6_1 = mp
            L6_1 = L6_1.ReportLowfi
            L7_1 = L5_1.p1
            L8_1 = 180264216
            L6_1(L7_1, L8_1)
            break
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
