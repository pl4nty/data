local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if L0_1 < 4096 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = ",v"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "program files"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "\\vfscache\\"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "smartstage"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "xl.meta"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = ".pb"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = 0
L2_1 = 1
L3_1 = mp
L3_1 = L3_1.HEADERPAGE_SZ
L3_1 = L3_1 - 4
L4_1 = 1
for L5_1 = L2_1, L3_1, L4_1 do
  L6_1 = mp
  L6_1 = L6_1.readu_u32
  L7_1 = headerpage
  L8_1 = L5_1
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 == 1179403647 then
    L6_1 = mp
    L6_1 = L6_1.readu_u32
    L7_1 = headerpage
    L8_1 = L5_1 + 4
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 == 65794 or L6_1 == 65793 then
      L1_1 = L5_1 - 1
      break
    end
  end
end
if L1_1 ~= 0 then
  L2_1 = mp
  L2_1 = L2_1.readprotection
  L3_1 = true
  L2_1(L3_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = true
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
