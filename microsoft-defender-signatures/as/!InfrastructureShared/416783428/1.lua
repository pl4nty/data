local L0_1, L1_1, L2_1, L3_1
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
      if not L0_1 then
        L0_1 = hstrlog
        L0_1 = L0_1[5]
        L0_1 = L0_1.matched
        if not L0_1 then
          L0_1 = hstrlog
          L0_1 = L0_1[6]
          L0_1 = L0_1.matched
          if not L0_1 then
            L0_1 = hstrlog
            L0_1 = L0_1[7]
            L0_1 = L0_1.matched
            if not L0_1 then
              L0_1 = hstrlog
              L0_1 = L0_1[8]
              L0_1 = L0_1.matched
              if not L0_1 then
                L0_1 = hstrlog
                L0_1 = L0_1[9]
                L0_1 = L0_1.matched
                if not L0_1 then
                  L0_1 = hstrlog
                  L0_1 = L0_1[10]
                  L0_1 = L0_1.matched
                  if not L0_1 then
                    L0_1 = hstrlog
                    L0_1 = L0_1[11]
                    L0_1 = L0_1.matched
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
L1_1 = hstrlog
L1_1 = L1_1[12]
L1_1 = L1_1.matched
if not L1_1 then
  L1_1 = hstrlog
  L1_1 = L1_1[13]
  L1_1 = L1_1.matched
  if not L1_1 then
    L1_1 = hstrlog
    L1_1 = L1_1[14]
    L1_1 = L1_1.matched
    if not L1_1 then
      L1_1 = hstrlog
      L1_1 = L1_1[15]
      L1_1 = L1_1.matched
      if not L1_1 then
        L1_1 = hstrlog
        L1_1 = L1_1[16]
        L1_1 = L1_1.matched
        if not L1_1 then
          L1_1 = hstrlog
          L1_1 = L1_1[17]
          L1_1 = L1_1.matched
          if not L1_1 then
            L1_1 = hstrlog
            L1_1 = L1_1[18]
            L1_1 = L1_1.matched
            if not L1_1 then
              L1_1 = hstrlog
              L1_1 = L1_1[19]
              L1_1 = L1_1.matched
              if not L1_1 then
                L1_1 = hstrlog
                L1_1 = L1_1[20]
                L1_1 = L1_1.matched
                if not L1_1 then
                  L1_1 = hstrlog
                  L1_1 = L1_1[21]
                  L1_1 = L1_1.matched
                  if not L1_1 then
                    L1_1 = hstrlog
                    L1_1 = L1_1[22]
                    L1_1 = L1_1.matched
                    if not L1_1 then
                      L1_1 = hstrlog
                      L1_1 = L1_1[23]
                      L1_1 = L1_1.matched
                      if not L1_1 then
                        L1_1 = hstrlog
                        L1_1 = L1_1[24]
                        L1_1 = L1_1.matched
                        if not L1_1 then
                          L1_1 = hstrlog
                          L1_1 = L1_1[25]
                          L1_1 = L1_1.matched
                          if not L1_1 then
                            L1_1 = hstrlog
                            L1_1 = L1_1[26]
                            L1_1 = L1_1.matched
                            if not L1_1 then
                              L1_1 = hstrlog
                              L1_1 = L1_1[27]
                              L1_1 = L1_1.matched
                              if not L1_1 then
                                L1_1 = hstrlog
                                L1_1 = L1_1[28]
                                L1_1 = L1_1.matched
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
    end
  end
end
L2_1 = 0
if L0_1 then
  L2_1 = L2_1 + 2
end
if L1_1 then
  L2_1 = L2_1 + 1
end
if 3 <= L2_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
if 2 <= L2_1 then
  L3_1 = mp
  L3_1 = L3_1.SUSPICIOUS
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
