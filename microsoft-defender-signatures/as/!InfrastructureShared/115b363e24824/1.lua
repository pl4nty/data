local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = IsADConnectRole
L0_1 = L0_1()
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = bm
L0_1 = L0_1.GetSignatureMatchDuration
L0_1 = L0_1()
if 100000000 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = versioning
L0_1 = L0_1.GetEngineBuild
L0_1 = L0_1()
if 16700 <= L0_1 then
  L0_1 = versioning
  L0_1 = L0_1.GetOrgID
  L0_1 = L0_1()
  if L0_1 then
    L1_1 = bm
    L1_1 = L1_1.add_related_string
    L2_1 = "EntraConnectCompromiseOrgA"
    L3_1 = L0_1
    L4_1 = bm
    L4_1 = L4_1.RelatedStringBMReport
    L1_1(L2_1, L3_1, L4_1)
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
