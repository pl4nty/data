local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
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
L0_1 = L0_1[1]
L0_1 = L0_1.utf8p1
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.utf8p1
L2_1 = "NRI-DNS-ALT-SRV"
L3_1 = string
L3_1 = L3_1.format
L4_1 = "%s_%s"
L5_1 = L2_1
L6_1 = L0_1
L3_1 = L3_1(L4_1, L5_1, L6_1)
L4_1 = MpCommon
L4_1 = L4_1.GetPersistContextCountNoPath
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 and 0 < L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = isAlternateDNSServer
L6_1 = L0_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = "altDNS_"
  L6_1 = L0_1
  L5_1 = L5_1 .. L6_1
  L6_1 = MpCommon
  L6_1 = L6_1.QueryPersistContextNoPath
  L7_1 = L5_1
  L8_1 = L1_1
  L6_1 = L6_1(L7_1, L8_1)
  if not L6_1 then
    L7_1 = MpCommon
    L7_1 = L7_1.AppendPersistContextNoPath
    L8_1 = L5_1
    L9_1 = L1_1
    L10_1 = 3600
    L7_1(L8_1, L9_1, L10_1)
  end
  L7_1 = MpCommon
  L7_1 = L7_1.GetPersistContextCountNoPath
  L8_1 = L5_1
  L7_1 = L7_1(L8_1)
  if 5 < L7_1 then
    L8_1 = MpCommon
    L8_1 = L8_1.AppendPersistContextNoPath
    L9_1 = L2_1
    L10_1 = L5_1
    L11_1 = 60
    L8_1(L9_1, L10_1, L11_1)
    L8_1 = mp
    L8_1 = L8_1.INFECTED
    return L8_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
