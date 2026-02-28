local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = hstrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if not L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.matched
  if not L0_1 then
    L0_1 = hstrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.matched
    if not L0_1 then
      L0_1 = hstrlog
      L0_1 = L0_1[4]
      L0_1 = L0_1.matched
    end
  end
end
L1_1 = hstrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if not L1_1 then
  L1_1 = hstrlog
  L1_1 = L1_1[7]
  L1_1 = L1_1.matched
  if not L1_1 then
    L1_1 = hstrlog
    L1_1 = L1_1[9]
    L1_1 = L1_1.matched
    if not L1_1 then
      goto lbl_47
    end
  end
end
L1_1 = hstrlog
L1_1 = L1_1[6]
L1_1 = L1_1.matched
if not L1_1 then
  L1_1 = hstrlog
  L1_1 = L1_1[8]
  L1_1 = L1_1.matched
  if not L1_1 then
    L1_1 = hstrlog
    L1_1 = L1_1[10]
    L1_1 = L1_1.matched
  end
end
::lbl_47::
L2_1 = hstrlog
L2_1 = L2_1[25]
L2_1 = L2_1.matched
if not L2_1 then
  L2_1 = hstrlog
  L2_1 = L2_1[26]
  L2_1 = L2_1.matched
  if not L2_1 then
    L2_1 = hstrlog
    L2_1 = L2_1[27]
    L2_1 = L2_1.matched
  end
end
L3_1 = hstrlog
L3_1 = L3_1[11]
L3_1 = L3_1.matched
if not L3_1 then
  L3_1 = hstrlog
  L3_1 = L3_1[12]
  L3_1 = L3_1.matched
  if not L3_1 then
    L3_1 = hstrlog
    L3_1 = L3_1[13]
    L3_1 = L3_1.matched
    if not L3_1 then
      L3_1 = hstrlog
      L3_1 = L3_1[14]
      L3_1 = L3_1.matched
      if not L3_1 then
        L3_1 = hstrlog
        L3_1 = L3_1[15]
        L3_1 = L3_1.matched
        if not L3_1 then
          L3_1 = hstrlog
          L3_1 = L3_1[16]
          L3_1 = L3_1.matched
          if not L3_1 then
            L3_1 = hstrlog
            L3_1 = L3_1[17]
            L3_1 = L3_1.matched
            if not L3_1 then
              L3_1 = hstrlog
              L3_1 = L3_1[18]
              L3_1 = L3_1.matched
              if not L3_1 then
                L3_1 = hstrlog
                L3_1 = L3_1[19]
                L3_1 = L3_1.matched
                if not L3_1 then
                  L3_1 = hstrlog
                  L3_1 = L3_1[20]
                  L3_1 = L3_1.matched
                  if not L3_1 then
                    L3_1 = hstrlog
                    L3_1 = L3_1[21]
                    L3_1 = L3_1.matched
                    if not L3_1 then
                      L3_1 = hstrlog
                      L3_1 = L3_1[22]
                      L3_1 = L3_1.matched
                      if not L3_1 then
                        L3_1 = hstrlog
                        L3_1 = L3_1[23]
                        L3_1 = L3_1.matched
                        if not L3_1 then
                          L3_1 = hstrlog
                          L3_1 = L3_1[24]
                          L3_1 = L3_1.matched
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
    end
  end
end
L4_1 = 0
if L0_1 or L1_1 then
  L4_1 = L4_1 + 2
end
if L2_1 then
  L4_1 = L4_1 + 1
end
if L3_1 then
  L4_1 = L4_1 + 1
end
if L4_1 == 4 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if 3 <= L4_1 then
  L5_1 = mp
  L5_1 = L5_1.SUSPICIOUS
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
