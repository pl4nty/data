-- Threat: !InfrastructureShared
-- Name: !#Lua:TriggerCymulateResourceScan.A
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: RPF:TopLevelFile & (!MpIsAMSIScan)

local l_0_0 = MpCommon.AtomicCounterValue("TriggerCymulateResourceScan")
if l_0_0 then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) ~= true then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = MpCommon.PathToWin32Path(l_0_1)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
local l_0_3 = {
  "\\cymulate\\av$",
  "\\cymulate\\edr_attacks$"
}
if contains(l_0_2, l_0_3, false) then
  mp.TriggerScanResource("folder", l_0_2)
  MpCommon.AtomicCounterSet("TriggerCymulateResourceScan", 1, 3600)
  return mp.INFECTED
end
return mp.CLEAN
