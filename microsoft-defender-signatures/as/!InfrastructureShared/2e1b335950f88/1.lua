local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L1_1 = false
L2_1 = 0
L3_1 = this_sigattrlog
L3_1 = L3_1[6]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[6]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[6]
    L3_1 = L3_1.utf8p2
    L4_1 = L3_1
    L3_1 = L3_1.lower
    L3_1 = L3_1(L4_1)
    L0_1 = L3_1
end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[7]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[7]
    L3_1 = L3_1.utf8p2
    if L3_1 ~= nil then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[7]
      L3_1 = L3_1.utf8p2
      L4_1 = L3_1
      L3_1 = L3_1.lower
      L3_1 = L3_1(L4_1)
      L0_1 = L3_1
    end
  end
end
L3_1 = isIEXfound
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L0_1
L3_1 = L0_1.len
L3_1 = L3_1(L4_1)
L2_1 = L3_1
if 400 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = "(?:gp|get-itemproperty).{0,10}(?:hkcu|hklm)"
L4_1 = MpCommon
L4_1 = L4_1.StringRegExpSearch
L5_1 = L3_1
L6_1 = L0_1
L4_1, L5_1 = L4_1(L5_1, L6_1)
_ = L5_1
L1_1 = L4_1
if L1_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
