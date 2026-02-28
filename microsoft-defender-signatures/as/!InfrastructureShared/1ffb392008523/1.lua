local L0_1, L1_1, L2_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.timestamp
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.timestamp
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.timestamp
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[2]
      L0_1 = L1_1.timestamp
    end
  end
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.timestamp
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L1_1 = L2_1.timestamp
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.timestamp
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[4]
      L1_1 = L2_1.timestamp
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[5]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[5]
      L2_1 = L2_1.timestamp
      if L2_1 ~= nil then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[5]
        L1_1 = L2_1.timestamp
    end
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[6]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[6]
        L2_1 = L2_1.timestamp
        if L2_1 ~= nil then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[6]
          L1_1 = L2_1.timestamp
      end
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[7]
        L2_1 = L2_1.matched
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[7]
          L2_1 = L2_1.timestamp
          if L2_1 ~= nil then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[7]
            L1_1 = L2_1.timestamp
        end
        else
          L2_1 = this_sigattrlog
          L2_1 = L2_1[8]
          L2_1 = L2_1.matched
          if L2_1 then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[8]
            L2_1 = L2_1.timestamp
            if L2_1 ~= nil then
              L2_1 = this_sigattrlog
              L2_1 = L2_1[8]
              L1_1 = L2_1.timestamp
          end
          else
            L2_1 = this_sigattrlog
            L2_1 = L2_1[9]
            L2_1 = L2_1.matched
            if L2_1 then
              L2_1 = this_sigattrlog
              L2_1 = L2_1[9]
              L2_1 = L2_1.timestamp
              if L2_1 ~= nil then
                L2_1 = this_sigattrlog
                L2_1 = L2_1[9]
                L1_1 = L2_1.timestamp
            end
            else
              L2_1 = this_sigattrlog
              L2_1 = L2_1[10]
              L2_1 = L2_1.matched
              if L2_1 then
                L2_1 = this_sigattrlog
                L2_1 = L2_1[10]
                L2_1 = L2_1.timestamp
                if L2_1 ~= nil then
                  L2_1 = this_sigattrlog
                  L2_1 = L2_1[10]
                  L1_1 = L2_1.timestamp
                end
              end
            end
          end
        end
      end
    end
  end
end
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L0_1 < L1_1 then
  L2_1 = reportRelatedBmHits
  L2_1()
  L2_1 = addRelatedProcess
  L2_1()
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
