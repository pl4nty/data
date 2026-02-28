local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.utf8p1
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.utf8p1
    if L2_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[3]
      L3_1 = L3_1.utf8p1
      L2_1 = L2_1(L3_1)
      L0_1 = L2_1
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[4]
      L2_1 = L2_1.utf8p1
      if L2_1 ~= nil then
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = this_sigattrlog
        L3_1 = L3_1[4]
        L3_1 = L3_1.utf8p1
        L2_1 = L2_1(L3_1)
        L0_1 = L2_1
    end
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[5]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[5]
        L2_1 = L2_1.utf8p1
        if L2_1 ~= nil then
          L2_1 = string
          L2_1 = L2_1.lower
          L3_1 = this_sigattrlog
          L3_1 = L3_1[5]
          L3_1 = L3_1.utf8p1
          L2_1 = L2_1(L3_1)
          L0_1 = L2_1
      end
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[6]
        L2_1 = L2_1.matched
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[6]
          L2_1 = L2_1.utf8p1
          if L2_1 ~= nil then
            L2_1 = string
            L2_1 = L2_1.lower
            L3_1 = this_sigattrlog
            L3_1 = L3_1[6]
            L3_1 = L3_1.utf8p1
            L2_1 = L2_1(L3_1)
            L0_1 = L2_1
        end
        else
          L2_1 = this_sigattrlog
          L2_1 = L2_1[7]
          L2_1 = L2_1.matched
          if L2_1 then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[7]
            L2_1 = L2_1.utf8p1
            if L2_1 ~= nil then
              L2_1 = string
              L2_1 = L2_1.lower
              L3_1 = this_sigattrlog
              L3_1 = L3_1[7]
              L3_1 = L3_1.utf8p1
              L2_1 = L2_1(L3_1)
              L0_1 = L2_1
          end
          else
            L2_1 = this_sigattrlog
            L2_1 = L2_1[8]
            L2_1 = L2_1.matched
            if L2_1 then
              L2_1 = this_sigattrlog
              L2_1 = L2_1[8]
              L2_1 = L2_1.utf8p1
              if L2_1 ~= nil then
                L2_1 = string
                L2_1 = L2_1.lower
                L3_1 = this_sigattrlog
                L3_1 = L3_1[8]
                L3_1 = L3_1.utf8p1
                L2_1 = L2_1(L3_1)
                L0_1 = L2_1
            end
            else
              L2_1 = this_sigattrlog
              L2_1 = L2_1[9]
              L2_1 = L2_1.matched
              if L2_1 then
                L2_1 = this_sigattrlog
                L2_1 = L2_1[9]
                L2_1 = L2_1.utf8p1
                if L2_1 ~= nil then
                  L2_1 = string
                  L2_1 = L2_1.lower
                  L3_1 = this_sigattrlog
                  L3_1 = L3_1[9]
                  L3_1 = L3_1.utf8p1
                  L2_1 = L2_1(L3_1)
                  L0_1 = L2_1
                end
              end
            end
          end
        end
      end
    end
  end
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L0_1
L4_1 = "/%.[^/]+$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[10]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[10]
    L2_1 = L2_1.utf8p1
    if L2_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[10]
      L3_1 = L3_1.utf8p1
      L2_1 = L2_1(L3_1)
      L1_1 = L2_1
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[11]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[11]
      L2_1 = L2_1.utf8p1
      if L2_1 ~= nil then
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = this_sigattrlog
        L3_1 = L3_1[11]
        L3_1 = L3_1.utf8p1
        L2_1 = L2_1(L3_1)
        L1_1 = L2_1
    end
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[12]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[12]
        L2_1 = L2_1.utf8p1
        if L2_1 ~= nil then
          L2_1 = string
          L2_1 = L2_1.lower
          L3_1 = this_sigattrlog
          L3_1 = L3_1[12]
          L3_1 = L3_1.utf8p1
          L2_1 = L2_1(L3_1)
          L1_1 = L2_1
      end
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[13]
        L2_1 = L2_1.matched
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[13]
          L2_1 = L2_1.utf8p1
          if L2_1 ~= nil then
            L2_1 = string
            L2_1 = L2_1.lower
            L3_1 = this_sigattrlog
            L3_1 = L3_1[13]
            L3_1 = L3_1.utf8p1
            L2_1 = L2_1(L3_1)
            L1_1 = L2_1
          end
        end
      end
    end
  end
  if L0_1 == L1_1 then
    L2_1 = addRelatedProcess
    L2_1()
    L2_1 = TrackPidAndTechniqueBM
    L3_1 = "BM"
    L4_1 = "T1564"
    L5_1 = "DefenseEvasion_Hiddenfiles_droppedhidden"
    L2_1(L3_1, L4_1, L5_1)
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
