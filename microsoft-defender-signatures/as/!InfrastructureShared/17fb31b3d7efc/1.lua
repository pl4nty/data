local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L1_1 = MpCommon
L1_1 = L1_1.GetPersistContextNoPath
L2_1 = "lnkarg_sb"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    if L2_1 then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[2]
      L3_1 = L3_1.utf8p2
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
      L2_1 = L2_1.utf8p2
      if L2_1 then
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = this_sigattrlog
        L3_1 = L3_1[3]
        L3_1 = L3_1.utf8p2
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
        L2_1 = L2_1.utf8p2
        if L2_1 then
          L2_1 = string
          L2_1 = L2_1.lower
          L3_1 = this_sigattrlog
          L3_1 = L3_1[4]
          L3_1 = L3_1.utf8p2
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
          L2_1 = L2_1.utf8p2
          if L2_1 then
            L2_1 = string
            L2_1 = L2_1.lower
            L3_1 = this_sigattrlog
            L3_1 = L3_1[5]
            L3_1 = L3_1.utf8p2
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
            L2_1 = L2_1.utf8p2
            if L2_1 then
              L2_1 = string
              L2_1 = L2_1.lower
              L3_1 = this_sigattrlog
              L3_1 = L3_1[6]
              L3_1 = L3_1.utf8p2
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
              L2_1 = L2_1.utf8p2
              if L2_1 then
                L2_1 = string
                L2_1 = L2_1.lower
                L3_1 = this_sigattrlog
                L3_1 = L3_1[7]
                L3_1 = L3_1.utf8p2
                L2_1 = L2_1(L3_1)
                L0_1 = L2_1
            end
            else
              L2_1 = mp
              L2_1 = L2_1.CLEAN
              return L2_1
            end
          end
        end
      end
    end
  end
end
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = contains
  L8_1 = L0_1
  L9_1 = L6_1
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 then
    L7_1 = mp
    L7_1 = L7_1.INFECTED
    return L7_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
