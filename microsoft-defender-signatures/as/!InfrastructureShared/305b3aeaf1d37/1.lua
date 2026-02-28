local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L1_1 = this_sigattrlog
L1_1 = L1_1[7]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[7]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[7]
    L0_1 = L1_1.utf8p2
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[8]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[8]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[8]
      L0_1 = L1_1.utf8p2
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[9]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[9]
      L1_1 = L1_1.utf8p2
      if L1_1 ~= nil then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[9]
        L0_1 = L1_1.utf8p2
    end
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[10]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[10]
        L1_1 = L1_1.utf8p2
        if L1_1 ~= nil then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[10]
          L0_1 = L1_1.utf8p2
      end
      else
        L1_1 = this_sigattrlog
        L1_1 = L1_1[11]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[11]
          L1_1 = L1_1.utf8p2
          if L1_1 ~= nil then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[11]
            L0_1 = L1_1.utf8p2
        end
        else
          L1_1 = this_sigattrlog
          L1_1 = L1_1[12]
          L1_1 = L1_1.matched
          if L1_1 then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[12]
            L1_1 = L1_1.utf8p2
            if L1_1 ~= nil then
              L1_1 = this_sigattrlog
              L1_1 = L1_1[12]
              L0_1 = L1_1.utf8p2
          end
          else
            L1_1 = this_sigattrlog
            L1_1 = L1_1[13]
            L1_1 = L1_1.matched
            if L1_1 then
              L1_1 = this_sigattrlog
              L1_1 = L1_1[13]
              L1_1 = L1_1.utf8p2
              if L1_1 ~= nil then
                L1_1 = this_sigattrlog
                L1_1 = L1_1[13]
                L0_1 = L1_1.utf8p2
            end
            else
              L1_1 = this_sigattrlog
              L1_1 = L1_1[14]
              L1_1 = L1_1.matched
              if L1_1 then
                L1_1 = this_sigattrlog
                L1_1 = L1_1[14]
                L1_1 = L1_1.utf8p2
                if L1_1 ~= nil then
                  L1_1 = this_sigattrlog
                  L1_1 = L1_1[14]
                  L0_1 = L1_1.utf8p2
                end
              end
            end
          end
        end
      end
    end
  end
end
L1_1 = {}
L2_1 = "curl "
L3_1 = "wget "
L4_1 = "whoami"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
if L0_1 ~= nil then
  L2_1 = ipairs
  L3_1 = L1_1
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = string
    L7_1 = L7_1.find
    L8_1 = L0_1
    L9_1 = L6_1
    L7_1 = L7_1(L8_1, L9_1)
    if L7_1 then
      L7_1 = mp
      L7_1 = L7_1.INFECTED
      return L7_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
