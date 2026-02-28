local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 ~= nil and 10240 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = LoadMatchedDataInBuffer
L1_1 = L1_1()
L2_1 = "ftpget -v -u [%w+] -p [%w+] -p 21 [%d]+%.[%d]+%.[%d]+%.[%d]+ [/%w%.%s%-_]+;%schmod%s%+x%s[/%w%.%-_]+;%s+[/%w%s%.%-_]+;%srm%s%-rf?%s[/%w%.%-_]+"
L3_1 = GetPatternOccurenceCount
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if 5 < L3_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
