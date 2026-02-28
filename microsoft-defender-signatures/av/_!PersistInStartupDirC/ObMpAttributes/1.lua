local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = versioning
L1_1 = L1_1.GetOrgID
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = type
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 == "string" then
    goto lbl_30
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_30::
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= "64eacc49-6a31-42c6-9b39-c3d9148e65f4" and L1_1 ~= "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" and L1_1 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" then
  L2_1 = MpCommon
  L2_1 = L2_1.IsSampled
  L3_1 = 25000
  L4_1 = false
  L5_1 = false
  L6_1 = false
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 ~= true then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILENAME
L2_1 = L2_1(L3_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "attackiqpersistencethroughstartupfolderbinary"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
