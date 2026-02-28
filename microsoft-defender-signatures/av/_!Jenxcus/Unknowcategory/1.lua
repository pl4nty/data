local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "TARG:Worm:VBS/Jenxcus!Crypt1"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 110000 or 500000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = tostring
L2_1 = headerpage
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "'execute%(%p%((%d%d%d?%d?)%-%s(%d%d%d?%d?)%)%s&%s%p%((%d%d%d?%d?)%-%s(%d%d%d?%d?)%)%s&%s%p%((%d%d%d?%d?)%-%s(%d%d%d?%d?)%)"
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
if L3_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
if L4_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
if L5_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
if L6_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
if L7_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = L2_1 - L3_1
L9_1 = string
L9_1 = L9_1.char
L10_1 = L8_1
L9_1 = L9_1(L10_1)
if L9_1 ~= "'" then
  L9_1 = string
  L9_1 = L9_1.char
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  if L9_1 ~= "\r" then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
end
L8_1 = L4_1 - L5_1
L9_1 = string
L9_1 = L9_1.char
L10_1 = L8_1
L9_1 = L9_1(L10_1)
if L9_1 ~= "=" then
  L9_1 = string
  L9_1 = L9_1.char
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  if L9_1 ~= "<" then
    L9_1 = string
    L9_1 = L9_1.char
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if L9_1 ~= "\n" then
      L9_1 = mp
      L9_1 = L9_1.CLEAN
      return L9_1
    end
  end
end
L8_1 = L6_1 - L7_1
L9_1 = string
L9_1 = L9_1.char
L10_1 = L8_1
L9_1 = L9_1(L10_1)
if L9_1 ~= "-" then
  L9_1 = string
  L9_1 = L9_1.char
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  if L9_1 ~= "[" then
    L9_1 = string
    L9_1 = L9_1.char
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if L9_1 ~= "h" then
      L9_1 = mp
      L9_1 = L9_1.CLEAN
      return L9_1
    end
  end
end
L9_1 = mp
L9_1 = L9_1.INFECTED
return L9_1
