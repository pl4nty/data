local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 1048576 < L0_1 or L0_1 < 4096 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = headerpage
L1_1 = L1_1[1]
if L1_1 == 219 then
  L1_1 = mp
  L1_1 = L1_1.readu_u16
  L2_1 = headerpage
  L3_1 = 4
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == 26313 then
    L1_1 = headerpage
    L1_1 = L1_1[6]
    if L1_1 == 185 then
      L1_1 = mp
      L1_1 = L1_1.readu_u32
      L2_1 = headerpage
      L3_1 = 9
      L1_1 = L1_1(L2_1, L3_1)
      if L1_1 == 4294967272 then
        L1_1 = headerpage
        L1_1 = L1_1[13]
        if L1_1 == 255 then
          L1_1 = headerpage
          L1_1 = L1_1[21]
          if L1_1 == 49 then
            L1_1 = headerpage
            L1_1 = L1_1[22]
            L2_1 = headerpage
            L2_1 = L2_1[25]
            if L1_1 == L2_1 then
              L1_1 = headerpage
              L1_1 = L1_1[23]
              L2_1 = headerpage
              L2_1 = L2_1[26]
              if L1_1 == L2_1 then
                L1_1 = headerpage
                L1_1 = L1_1[24]
                if L1_1 == 3 then
                  L1_1 = headerpage
                  L1_1 = L1_1[27]
                  if L1_1 == 131 then
                    L1_1 = mp
                    L1_1 = L1_1.INFECTED
                    return L1_1
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
