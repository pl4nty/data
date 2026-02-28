local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = peattributes
L0_1 = L0_1.isdll
if L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[1]
  if L0_1 then
    L0_1 = hstrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.matched
    if L0_1 then
      L0_1 = mp
      L0_1 = L0_1.readprotection
      L1_1 = false
      L0_1(L1_1)
      L0_1 = nil
      L1_1 = 0
      L2_1 = hstrlog
      L2_1 = L2_1[1]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = mp
        L2_1 = L2_1.readfile
        L3_1 = pe
        L3_1 = L3_1.foffset_va
        L4_1 = hstrlog
        L4_1 = L4_1[1]
        L4_1 = L4_1.VA
        L3_1 = L3_1(L4_1)
        L3_1 = L3_1 - 3
        L4_1 = 4
        L2_1 = L2_1(L3_1, L4_1)
        L0_1 = L2_1
        L2_1 = hstrlog
        L2_1 = L2_1[1]
        L2_1 = L2_1.VA
        L1_1 = L2_1 - 6
      end
      if L0_1 ~= nil then
        L2_1 = mp
        L2_1 = L2_1.readu_u32
        L3_1 = L0_1
        L4_1 = 1
        L2_1 = L2_1(L3_1, L4_1)
        if L2_1 ~= nil then
          L3_1 = L2_1 + L1_1
          L0_1 = L3_1 + 7
          L3_1 = mp
          L3_1 = L3_1.readfile
          L4_1 = pe
          L4_1 = L4_1.foffset_va
          L5_1 = L0_1
          L4_1 = L4_1(L5_1)
          L5_1 = 15
          L3_1 = L3_1(L4_1, L5_1)
          L0_1 = L3_1
          if L0_1 ~= nil then
            L3_1 = mp
            L3_1 = L3_1.readu_u64
            L4_1 = L0_1
            L5_1 = 1
            L3_1 = L3_1(L4_1, L5_1)
            L2_1 = L3_1
            if L2_1 ~= nil then
              L3_1 = mp
              L3_1 = L3_1.readfile
              L4_1 = pe
              L4_1 = L4_1.foffset_va
              L5_1 = L2_1
              L4_1 = L4_1(L5_1)
              L5_1 = 20
              L3_1 = L3_1(L4_1, L5_1)
              L4_1 = #L3_1
              if L4_1 == 20 then
                L4_1 = tostring
                L5_1 = L3_1
                L4_1 = L4_1(L5_1)
                L6_1 = L4_1
                L5_1 = L4_1.match
                L7_1 = "[ -~]+"
                L5_1 = L5_1(L6_1, L7_1)
                if L5_1 ~= "" then
                  L7_1 = L5_1
                  L6_1 = L5_1.match
                  L8_1 = "^[%w]+%.[%a][%a][%a]?[%a]?$"
                  L6_1 = L6_1(L7_1, L8_1)
                  if L6_1 then
                    L7_1 = L5_1
                    L6_1 = L5_1.match
                    L8_1 = "%.log$"
                    L6_1 = L6_1(L7_1, L8_1)
                    if not L6_1 then
                      L7_1 = L5_1
                      L6_1 = L5_1.match
                      L8_1 = "%.dll$"
                      L6_1 = L6_1(L7_1, L8_1)
                      if not L6_1 then
                        L7_1 = L5_1
                        L6_1 = L5_1.match
                        L8_1 = "%.exe$"
                        L6_1 = L6_1(L7_1, L8_1)
                        if not L6_1 then
                          L6_1 = mp
                          L6_1 = L6_1.readprotection
                          L7_1 = true
                          L6_1(L7_1)
                          L6_1 = mp
                          L6_1 = L6_1.INFECTED
                          return L6_1
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
      L2_1 = mp
      L2_1 = L2_1.readprotection
      L3_1 = true
      L2_1(L3_1)
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
