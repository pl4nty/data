local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[4]
      L0_1 = L1_1.utf8p2
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L1_1 = L1_1.utf8p2
      if L1_1 ~= nil then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[3]
        L0_1 = L1_1.utf8p2
    end
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[2]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[2]
        L1_1 = L1_1.utf8p2
        if L1_1 ~= nil then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[2]
          L0_1 = L1_1.utf8p2
      end
      else
        L1_1 = this_sigattrlog
        L1_1 = L1_1[5]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[5]
          L1_1 = L1_1.utf8p2
          if L1_1 ~= nil then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[5]
            L0_1 = L1_1.utf8p2
        end
        else
          L1_1 = this_sigattrlog
          L1_1 = L1_1[6]
          L1_1 = L1_1.matched
          if L1_1 then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[6]
            L1_1 = L1_1.utf8p2
            if L1_1 ~= nil then
              L1_1 = this_sigattrlog
              L1_1 = L1_1[6]
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
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
if L0_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.GetExecutablesFromCommandLine
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L2_1 = ipairs
  L3_1 = L1_1
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = mp
    L7_1 = L7_1.ContextualExpandEnvironmentVariables
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    L6_1 = L7_1
    L7_1 = sysio
    L7_1 = L7_1.IsFileExists
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    if L7_1 then
      L7_1 = bm
      L7_1 = L7_1.add_related_file
      L8_1 = L6_1
      L7_1(L8_1)
      L7_1 = mp
      L7_1 = L7_1.INFECTED
      return L7_1
    end
  end
end
L1_1 = add_parents
L1_1()
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
