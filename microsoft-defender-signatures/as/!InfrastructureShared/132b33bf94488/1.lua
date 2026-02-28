local L0_1, L1_1, L2_1, L3_1
L0_1 = versioning
L0_1 = L0_1.GetOrgID
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L1_1["64eacc49-6a31-42c6-9b39-c3d9148e65f4"] = true
L1_1["0d5a49d5-57c7-40c0-ab8b-3a066e83b05a"] = true
L1_1["4ec5f50d-2073-4ecf-986c-0dcca43f933a"] = true
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L2_1 = L1_1[L2_1]
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
