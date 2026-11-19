-- Threat: !InfrastructureShared
-- Name: 587d7ca8c5b1e
-- Type: 21
-- Includes: ResearchData, LuaFuncHelper

local l_0_0 = mp.hstr_full_log()
if l_0_0 ~= nil then
  if l_0_0[1].matched or l_0_0[2].matched then
    set_research_data("TamperingCMD", "systemsettingsadminflows", false)
  elseif l_0_0[3].matched or l_0_0[4].matched then
    set_research_data("TamperingCMD", "DisableRealtimeMonitoring", false)
  elseif l_0_0[5].matched or l_0_0[6].matched or l_0_0[7].matched or l_0_0[8].matched then
    set_research_data("TamperingCMD", "DisableAntiVirus_DisableAntiSpyware", false)
  elseif l_0_0[9].matched or l_0_0[10].matched or l_0_0[11].matched or l_0_0[12].matched then
    set_research_data("TamperingCMD", "ServiceStop", false)
  end
end
local l_0_1 = mp.GetScannedPPID()
local l_0_2 = false
_, l_0_2 = pcall(MpCommon.QuerySessionInformation, l_0_1, MpCommon.WTSIsRemoteSession)
if MpCommon.NidSearch(mp.NID_ENABLE_EXTENDED_BAFS, 3) then
  set_research_data("Reason", "AggressivePeTrigger", false)
elseif GetRollingQueueKeys("ThreatsOnMachine_Lua") ~= nil then
  local l_0_3 = GetRollingQueueKeys("ThreatsOnMachine_Lua")
  if type(l_0_3) == "table" and next(l_0_3) ~= nil then
    set_research_data("Reason", "ExistingThreatsOnMachine", false)
    set_research_data("ThreatsOnMachine", "[" .. table.concat(l_0_3, "|") .. "]", false)
  end
elseif l_0_2 then
  local l_0_4 = MpCommon.WTSUserName
  if MpCommon.QueryPersistContextNoPath("MpNewRemoteUsers", l_0_4) then
    set_research_data("Reason", "NewRemoteUser", false)
  end
else
  return mp.CLEAN
end
return mp.LOWFI
