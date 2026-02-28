local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    L0_1 = L1_1.utf8p1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[5]
    L1_1 = L1_1.utf8p1
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[5]
      L0_1 = L1_1.utf8p1
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[6]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[6]
      L1_1 = L1_1.utf8p1
      if L1_1 ~= nil then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[6]
        L0_1 = L1_1.utf8p1
    end
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[7]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[7]
        L1_1 = L1_1.utf8p1
        if L1_1 ~= nil then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[7]
          L0_1 = L1_1.utf8p1
      end
      else
        L1_1 = this_sigattrlog
        L1_1 = L1_1[8]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[8]
          L1_1 = L1_1.utf8p1
          if L1_1 ~= nil then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[8]
            L0_1 = L1_1.utf8p1
        end
        else
          L1_1 = this_sigattrlog
          L1_1 = L1_1[9]
          L1_1 = L1_1.matched
          if L1_1 then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[9]
            L1_1 = L1_1.utf8p1
            if L1_1 ~= nil then
              L1_1 = this_sigattrlog
              L1_1 = L1_1[9]
              L0_1 = L1_1.utf8p1
          end
          else
            L1_1 = this_sigattrlog
            L1_1 = L1_1[10]
            L1_1 = L1_1.matched
            if L1_1 then
              L1_1 = this_sigattrlog
              L1_1 = L1_1[10]
              L1_1 = L1_1.utf8p1
              if L1_1 ~= nil then
                L1_1 = this_sigattrlog
                L1_1 = L1_1[10]
                L0_1 = L1_1.utf8p1
            end
            else
              L1_1 = this_sigattrlog
              L1_1 = L1_1[11]
              L1_1 = L1_1.matched
              if L1_1 then
                L1_1 = this_sigattrlog
                L1_1 = L1_1[11]
                L1_1 = L1_1.utf8p1
                if L1_1 ~= nil then
                  L1_1 = this_sigattrlog
                  L1_1 = L1_1[11]
                  L0_1 = L1_1.utf8p1
              end
              else
                L1_1 = this_sigattrlog
                L1_1 = L1_1[12]
                L1_1 = L1_1.matched
                if L1_1 then
                  L1_1 = this_sigattrlog
                  L1_1 = L1_1[12]
                  L1_1 = L1_1.utf8p1
                  if L1_1 ~= nil then
                    L1_1 = this_sigattrlog
                    L1_1 = L1_1[12]
                    L0_1 = L1_1.utf8p1
                end
                else
                  L1_1 = this_sigattrlog
                  L1_1 = L1_1[13]
                  L1_1 = L1_1.matched
                  if L1_1 then
                    L1_1 = this_sigattrlog
                    L1_1 = L1_1[13]
                    L1_1 = L1_1.utf8p1
                    if L1_1 ~= nil then
                      L1_1 = this_sigattrlog
                      L1_1 = L1_1[13]
                      L0_1 = L1_1.utf8p1
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
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "deleted"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 then
    L1_1 = string
    L1_1 = L1_1.match
    L2_1 = L0_1
    L3_1 = "(/.+)%s%(deleted"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 ~= nil then
      L0_1 = L1_1
    end
  end
  L1_1 = isTainted
  L2_1 = L0_1
  L3_1 = "static_hit"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
