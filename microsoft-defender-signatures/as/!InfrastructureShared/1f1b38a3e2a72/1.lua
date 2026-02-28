local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
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
L2_1 = nil
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[8]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[8]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[8]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= nil then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[8]
      L2_1 = L4_1.utf8p1
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = this_sigattrlog
      L5_1 = L5_1[8]
      L5_1 = L5_1.utf8p2
      L4_1 = L4_1(L5_1)
      L3_1 = L4_1
    end
  end
end
L4_1 = this_sigattrlog
L4_1 = L4_1[9]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[9]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[9]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= nil then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[9]
      L2_1 = L4_1.utf8p1
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = this_sigattrlog
      L5_1 = L5_1[9]
      L5_1 = L5_1.utf8p2
      L4_1 = L4_1(L5_1)
      L3_1 = L4_1
    end
  end
end
if L2_1 == nil or L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L2_1
L4_1 = L2_1.match
L6_1 = "(%d+):(%d+)"
L4_1, L5_1 = L4_1(L5_1, L6_1)
if L4_1 == nil or L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = type
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 ~= "number" then
  L6_1 = tonumber
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  L5_1 = L6_1
end
L6_1 = type
L7_1 = L4_1
L6_1 = L6_1(L7_1)
if L6_1 ~= "number" then
  L6_1 = tonumber
  L7_1 = L4_1
  L6_1 = L6_1(L7_1)
  L4_1 = L6_1
end
if (L5_1 == 16 or L5_1 == 32 or L5_1 == 64 or L5_1 == 128) and L5_1 ~= L4_1 then
  L6_1 = GetSuspiciousAllocsInBmLog
  L6_1 = L6_1()
  if not L6_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = pairs
  L8_1 = L6_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1 in L7_1, L8_1, L9_1 do
    L11_1 = TriggerTargetedMemoryScan
    L12_1 = L10_1
    L11_1(L12_1)
    L11_1 = AddSuspiciousRegion
    L12_1 = L10_1
    L11_1(L12_1)
  end
  L7_1 = TrackPidAndTechniqueBM
  L8_1 = "BM"
  L9_1 = "T1620"
  L10_1 = "reflective_code_loading"
  L7_1(L8_1, L9_1, L10_1)
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
