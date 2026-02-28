local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = "hklm\\software\\microsoft\\windows defender\\exclusions\\ipaddresses\\\\"
L1_1 = "hklm\\software\\policies\\microsoft\\windows defender\\exclusions\\ipaddresses\\\\"
L2_1 = nil
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = string
  L4_1 = L4_1.sub
  L5_1 = this_sigattrlog
  L5_1 = L5_1[1]
  L5_1 = L5_1.utf8p1
  L6_1 = #L0_1
  L6_1 = L6_1 + 1
  L4_1 = L4_1(L5_1, L6_1)
  L2_1 = L4_1
  L3_1 = true
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[2]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = string
    L4_1 = L4_1.sub
    L5_1 = this_sigattrlog
    L5_1 = L5_1[2]
    L5_1 = L5_1.utf8p1
    L6_1 = #L0_1
    L6_1 = L6_1 + 1
    L4_1 = L4_1(L5_1, L6_1)
    L2_1 = L4_1
    L3_1 = false
  else
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.matched
    if L4_1 then
      L4_1 = string
      L4_1 = L4_1.sub
      L5_1 = this_sigattrlog
      L5_1 = L5_1[3]
      L5_1 = L5_1.utf8p1
      L6_1 = #L1_1
      L6_1 = L6_1 + 1
      L4_1 = L4_1(L5_1, L6_1)
      L2_1 = L4_1
      L3_1 = true
    else
      L4_1 = this_sigattrlog
      L4_1 = L4_1[4]
      L4_1 = L4_1.matched
      if L4_1 then
        L4_1 = string
        L4_1 = L4_1.sub
        L5_1 = this_sigattrlog
        L5_1 = L5_1[4]
        L5_1 = L5_1.utf8p1
        L6_1 = #L1_1
        L6_1 = L6_1 + 1
        L4_1 = L4_1(L5_1, L6_1)
        L2_1 = L4_1
        L3_1 = false
      end
    end
  end
end
if L2_1 ~= "New Value #1" then
  if L3_1 then
    L4_1 = addDefenderIPExclusion
    L5_1 = L2_1
    L4_1(L5_1)
  else
    L4_1 = removeDefenderIPExclusion
    L5_1 = L2_1
    L4_1(L5_1)
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
