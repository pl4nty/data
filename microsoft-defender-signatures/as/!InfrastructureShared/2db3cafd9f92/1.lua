local L0_1, L1_1, L2_1, L3_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = reportPersistedContext
  L1_1 = "deprecatedDnsRecordType"
  L2_1 = "bmurl"
  L3_1 = "SuspiciousDnsQuery.A"
  L0_1(L1_1, L2_1, L3_1)
  L0_1 = MpCommon
  L0_1 = L0_1.SetPersistContextNoPath
  L1_1 = "deprecatedDnsRecordType"
  L2_1 = {}
  L3_1 = 1
  L0_1(L1_1, L2_1, L3_1)
else
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = reportPersistedContext
    L1_1 = "unknownDnsRecordType"
    L2_1 = "bmurl"
    L3_1 = "SuspiciousDnsQuery.A"
    L0_1(L1_1, L2_1, L3_1)
    L0_1 = MpCommon
    L0_1 = L0_1.SetPersistContextNoPath
    L1_1 = "unknownDnsRecordType"
    L2_1 = {}
    L3_1 = 1
    L0_1(L1_1, L2_1, L3_1)
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
