local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = versioning
L0_1 = L0_1.GetTestMode
L0_1 = L0_1()
if L0_1 ~= 65000 then
  L0_1 = MpCommon
  L0_1 = L0_1.IsSampled
  L1_1 = 1000
  L2_1 = true
  L3_1 = true
  L4_1 = true
  L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
  if L0_1 == false then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = this_sigattrlog
L0_1 = L0_1[5]
L0_1 = L0_1.utf8p1
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "[%w%-%.]*%.[%w%-]+%.[%w]+"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.bitand
L2_1 = this_sigattrlog
L2_1 = L2_1[5]
L2_1 = L2_1.np2
L3_1 = 65535
L1_1 = L1_1(L2_1, L3_1)
L2_1 = "\001\002\003\004\005\006\a\b\t\n\v\f\r\014\015\016\017\018\019\020\021\022\023\024\025\026\027\028\029\030\031 !\"#$%&()*+,-./012345789:;<=>?cdefghijklm\249\250\251\252\253\254\255"
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = string
L5_1 = L5_1.char
L6_1 = L1_1
L5_1 = L5_1(L6_1)
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CheckUrl
L5_1 = L0_1
L4_1, L5_1 = L4_1(L5_1)
if L4_1 == 1 and L5_1 == 1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = MpCommon
L6_1 = L6_1.QueryPersistContextNoPath
L7_1 = "unknownDnsRecordType"
L8_1 = L0_1
L6_1 = L6_1(L7_1, L8_1)
if not L6_1 then
  L7_1 = MpCommon
  L7_1 = L7_1.AppendPersistContextNoPath
  L8_1 = "unknownDnsRecordType"
  L9_1 = L0_1
  L10_1 = 3600
  L7_1(L8_1, L9_1, L10_1)
end
L7_1 = MpCommon
L7_1 = L7_1.GetPersistContextCountNoPath
L8_1 = "unknownDnsRecordType"
L7_1 = L7_1(L8_1)
if 10 < L7_1 then
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
