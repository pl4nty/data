-- Threat: !InfrastructureShared
-- Name: !#Lua:CreateProcessContext/MpNewlyCreatedHint.A
-- Type: 12
-- MpAttributes: MpIsCreateProcessScan

if mp.get_mpattribute("Exception:FileWithNewlyCreatedHintContext") == true or mp.get_mpattribute("Exception:CreateProcessContext/MpNewlyCreatedHint") == true then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 <= 3 then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetPersistContextCount(l_0_0)
if l_0_1 == nil or l_0_1 <= 0 then
  return mp.CLEAN
end
local l_0_2 = false
if MpCommon.QueryPersistContext(l_0_0, "MpNewlyCreatedHint_5m") then
  mp.set_mpattribute("Lua:CreateProcessContext/MpNewlyCreatedHint_5m")
  l_0_2 = true
end
if MpCommon.QueryPersistContext(l_0_0, "MpNewlyCreatedHint_30m") then
  mp.set_mpattribute("Lua:CreateProcessContext/MpNewlyCreatedHint_30m")
  l_0_2 = true
end
if MpCommon.QueryPersistContext(l_0_0, "MpNewlyCreatedHint_2h") then
  mp.set_mpattribute("Lua:CreateProcessContext/MpNewlyCreatedHint_2h")
  l_0_2 = true
end
if l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
