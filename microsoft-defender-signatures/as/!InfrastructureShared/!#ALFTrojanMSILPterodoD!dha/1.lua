local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if L0_1 < 4096 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
L1_1 = L0_1 % 34
if L1_1 ~= 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pcall
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FULL
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L3_1(L4_1, L5_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
if L1_1 then
  L4_1 = L2_1
  L3_1 = L2_1.find
  L5_1 = "\\appdata\\local\\iconscache.db"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = tostring
  L4_1 = headerpage
  L3_1 = L3_1(L4_1)
  L4_1 = string
  L4_1 = L4_1.match
  L5_1 = string
  L5_1 = L5_1.sub
  L6_1 = L3_1
  L7_1 = 1
  L8_1 = 34
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  L6_1 = "^"
  L7_1 = "%x"
  L8_1 = L7_1
  L7_1 = L7_1.rep
  L9_1 = 32
  L7_1 = L7_1(L8_1, L9_1)
  L8_1 = "\r\n"
  L6_1 = L6_1 .. L7_1 .. L8_1
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = string
  L4_1 = L4_1.match
  L5_1 = string
  L5_1 = L5_1.sub
  L6_1 = L3_1
  L7_1 = 4047
  L8_1 = 4080
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  L6_1 = "^"
  L7_1 = "%x"
  L8_1 = L7_1
  L7_1 = L7_1.rep
  L9_1 = 32
  L7_1 = L7_1(L8_1, L9_1)
  L8_1 = "\r\n"
  L6_1 = L6_1 .. L7_1 .. L8_1
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
