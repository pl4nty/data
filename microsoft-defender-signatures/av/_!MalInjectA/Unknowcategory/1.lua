local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
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
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILENAME
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "injectable_dll_[^%.]+%.dll"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = "MpDisableMOACSyncInsert"
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = "MpDisableCaching"
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
L2_1 = L2_1(L3_1)
if L2_1 == nil then
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
L5_1 = "sleeping_binary_[^%.]+%.exe"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = versioning
L3_1 = L3_1.GetOrgID
L3_1 = L3_1()
if L3_1 ~= nil then
  L4_1 = type
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if L4_1 == "string" then
    goto lbl_90
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_90::
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
if L3_1 ~= "64eacc49-6a31-42c6-9b39-c3d9148e65f4" and L3_1 ~= "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" and L3_1 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" then
  L4_1 = MpCommon
  L4_1 = L4_1.IsSampled
  L5_1 = 15000
  L6_1 = false
  L7_1 = false
  L8_1 = false
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 ~= true then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
