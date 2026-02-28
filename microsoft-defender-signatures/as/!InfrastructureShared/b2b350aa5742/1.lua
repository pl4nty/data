local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = versioning
L0_1 = L0_1.GetOrgID
L0_1 = L0_1()
L1_1 = {}
L1_1["73a99e52-c380-4b86-9d47-fe1cb231f222"] = true
L1_1["9d61afa0-cfa4-4746-95af-dc897a6f6774"] = true
L1_1["8a2d9a03-1cd7-4b6a-9e63-6fb98b8c0e7a"] = true
L1_1["24d4a9cf-e7f1-400a-b2d4-bd534e1e168d"] = true
L1_1["a38396bc-49a9-4d9e-95a7-a7fdc4cdd463"] = true
if L0_1 ~= nil then
  L2_1 = L1_1[L0_1]
  if L2_1 ~= nil then
    goto lbl_18
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_18::
L2_1 = TrackPidAndTechniqueBM
L3_1 = "BM"
L4_1 = "T1620"
L5_1 = "reflective_code_loading"
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
