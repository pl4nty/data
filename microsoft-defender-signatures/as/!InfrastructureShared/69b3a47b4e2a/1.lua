local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L5_1 = this_sigattrlog
L5_1 = L5_1[2]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[2]
  L5_1 = L5_1.utf8p1
  if L5_1 ~= nil then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[4]
    L5_1 = L5_1.matched
    if L5_1 then
      L5_1 = this_sigattrlog
      L5_1 = L5_1[4]
      L5_1 = L5_1.utf8p2
      if L5_1 ~= nil then
        L5_1 = this_sigattrlog
        L5_1 = L5_1[5]
        L5_1 = L5_1.matched
        if L5_1 then
          L5_1 = this_sigattrlog
          L5_1 = L5_1[5]
          L5_1 = L5_1.utf8p1
          if L5_1 ~= nil then
            L5_1 = string
            L5_1 = L5_1.lower
            L6_1 = this_sigattrlog
            L6_1 = L6_1[4]
            L6_1 = L6_1.utf8p2
            L5_1 = L5_1(L6_1)
            L1_1 = L5_1
            L5_1 = string
            L5_1 = L5_1.lower
            L6_1 = this_sigattrlog
            L6_1 = L6_1[2]
            L6_1 = L6_1.utf8p1
            L5_1 = L5_1(L6_1)
            L3_1 = L5_1
            L5_1 = string
            L5_1 = L5_1.lower
            L6_1 = this_sigattrlog
            L6_1 = L6_1[5]
            L6_1 = L6_1.utf8p1
            L5_1 = L5_1(L6_1)
            L0_1 = L5_1
            L5_1 = string
            L5_1 = L5_1.match
            L6_1 = L0_1
            L7_1 = "imagename:(.-);targetprocessppid:(.+)"
            L5_1, L6_1 = L5_1(L6_1, L7_1)
            L2_1 = L6_1
            L4_1 = L5_1
            if L4_1 ~= nil and L2_1 ~= nil then
              L6_1 = L3_1
              L5_1 = L3_1.find
              L7_1 = L4_1
              L8_1 = 1
              L9_1 = true
              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
              if L5_1 then
                L6_1 = L1_1
                L5_1 = L1_1.find
                L7_1 = L2_1
                L8_1 = 1
                L9_1 = true
                L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                if L5_1 then
                  L5_1 = mp
                  L5_1 = L5_1.INFECTED
                  return L5_1
                end
              end
            end
          end
        end
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
