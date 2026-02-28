local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONOPEN
  if L0_1 == L1_1 then
    goto lbl_19
  end
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 == L1_1 then
    goto lbl_19
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_19::
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESS_ID
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L1_1 < 12 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:ProcessContextAttr.A!HasSystemProcId"
  L2_1(L3_1)
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESS_PPID
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = MpCommon
L3_1 = L3_1.GetProcessElevationAndIntegrityLevel
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 ~= nil then
  L4_1 = L3_1.IntegrityLevel
  if L4_1 ~= nil then
    L4_1 = L3_1.IntegrityLevel
    L5_1 = MpCommon
    L5_1 = L5_1.SECURITY_MANDATORY_SYSTEM_RID
    if L4_1 >= L5_1 then
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = "Lua:ProcessContextAttr.A!IntegrityLevelSystem"
      L4_1(L5_1)
    end
  end
  L4_1 = L3_1.IsElevated
  if L4_1 ~= nil then
    L4_1 = L3_1.IsElevated
    if L4_1 == true then
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = "Lua:ProcessContextAttr.A!IsElevated"
      L4_1(L5_1)
    end
  end
  L4_1 = L3_1.ElevationType
  if L4_1 ~= nil then
    L4_1 = type
    L5_1 = L3_1.ElevationType
    L4_1 = L4_1(L5_1)
    if L4_1 == "number" then
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = "Lua:ProcessContextAttr.A!ElevationType"
      L6_1 = tostring
      L7_1 = L3_1.ElevationType
      L6_1 = L6_1(L7_1)
      L5_1 = L5_1 .. L6_1
      L4_1(L5_1)
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
