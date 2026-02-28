local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = string
    L0_1 = L0_1.lower
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.utf8p1
    L0_1 = L0_1(L1_1)
    L1_1 = 1
    L2_1 = mp
    L2_1 = L2_1.SIGATTR_LOG_SZ
    L3_1 = 1
    for L4_1 = L1_1, L2_1, L3_1 do
      L5_1 = sigattr_head
      L5_1 = L5_1[L4_1]
      L5_1 = L5_1.matched
      if L5_1 then
        L5_1 = sigattr_head
        L5_1 = L5_1[L4_1]
        L5_1 = L5_1.attribute
        if L5_1 == 16384 then
          L5_1 = sigattr_head
          L5_1 = L5_1[L4_1]
          L5_1 = L5_1.utf8p1
          if L5_1 ~= nil then
            L5_1 = sigattr_head
            L5_1 = L5_1[L4_1]
            L5_1 = L5_1.utf8p2
            if L5_1 ~= nil then
              L5_1 = string
              L5_1 = L5_1.lower
              L6_1 = sigattr_head
              L6_1 = L6_1[L4_1]
              L6_1 = L6_1.utf8p1
              L5_1 = L5_1(L6_1)
              L6_1 = string
              L6_1 = L6_1.lower
              L7_1 = sigattr_head
              L7_1 = L7_1[L4_1]
              L7_1 = L7_1.utf8p2
              L6_1 = L6_1(L7_1)
              if L0_1 == L5_1 then
                L7_1 = string
                L7_1 = L7_1.find
                L8_1 = L5_1
                L9_1 = "appdata\\local\\temp\\rar$"
                L10_1 = 1
                L11_1 = true
                L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
                if L7_1 then
                  L7_1 = string
                  L7_1 = L7_1.match
                  L8_1 = L6_1
                  L9_1 = "fsize:(%d+)"
                  L7_1 = L7_1(L8_1, L9_1)
                  if L7_1 ~= nil then
                    L8_1 = tonumber
                    L9_1 = L7_1
                    L8_1 = L8_1(L9_1)
                    if L8_1 <= 1000000000 and 500000000 <= L8_1 then
                      L9_1 = this_sigattrlog
                      L9_1 = L9_1[1]
                      L9_1 = L9_1.utf8p2
                      if L9_1 ~= nil then
                        L9_1 = "|.7z|.zip|.rar|"
                        L10_1 = string
                        L10_1 = L10_1.lower
                        L11_1 = this_sigattrlog
                        L11_1 = L11_1[1]
                        L11_1 = L11_1.utf8p2
                        L10_1 = L10_1(L11_1)
                        L11_1 = bm_AddRelatedFileFromCommandLine
                        L12_1 = L10_1
                        L13_1 = L9_1
                        L11_1(L12_1, L13_1)
                      end
                      L9_1 = mp
                      L9_1 = L9_1.INFECTED
                      return L9_1
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
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
