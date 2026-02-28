local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L0_1 = L1_1[1]
  end
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p1
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[2]
      L1_1 = L1_1.utf8p2
      if L1_1 ~= nil then
        L1_1 = this_sigattrlog
        L0_1 = L1_1[2]
    end
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L1_1 = L1_1.utf8p1
      if L1_1 ~= nil then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[3]
        L1_1 = L1_1.utf8p2
        if L1_1 ~= nil then
          L1_1 = this_sigattrlog
          L0_1 = L1_1[3]
      end
    end
    else
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
          L1_1 = L1_1.utf8p2
          if L1_1 ~= nil then
            L1_1 = this_sigattrlog
            L0_1 = L1_1[4]
        end
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
            L1_1 = L1_1.utf8p2
            if L1_1 ~= nil then
              L1_1 = this_sigattrlog
              L0_1 = L1_1[5]
            end
          end
        end
      end
    end
  end
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = "DataExfilCreatedFile"
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L0_1.utf8p2
L2_1 = L2_1(L3_1)
L3_1 = IsKeyInRollingQueue
L4_1 = "DataComTrack"
L5_1 = L1_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L4_1 = next
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L4_1 = ipairs
    L5_1 = L3_1
    L4_1, L5_1, L6_1 = L4_1(L5_1)
    for L7_1, L8_1 in L4_1, L5_1, L6_1 do
      L9_1 = contains
      L10_1 = L2_1
      L11_1 = L8_1
      L9_1 = L9_1(L10_1, L11_1)
      if L9_1 then
        L9_1 = mp
        L9_1 = L9_1.INFECTED
        return L9_1
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
