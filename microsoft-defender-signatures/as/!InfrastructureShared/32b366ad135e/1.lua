-- Threat: !InfrastructureShared
-- Name: 32b366ad135e
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local function l_0_0(l_1_0, l_1_1)
  local l_1_2 = ""
  
  if l_1_1.context.attemptedFWBlock == true and l_1_1.context.WFBlockSucceeded == true then
    l_1_2 = "The ip[" .. l_1_1.ip .. "] is blocked by firewall rule, Based on the user's Remote Encryption config and aggressiveness level."
  elseif l_1_1.context.attemptedFWBlock == true and l_1_1.context.WFBlockSucceeded == false and l_1_0.State == MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_ENABLED then
    l_1_2 = "The ip[" .. l_1_1.ip .. "] is should be blocked but failed to add firewall rule!"
  elseif l_1_1.context.attemptedFWBlock == true and l_1_0.State == MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_AUDIT then
    l_1_2 = "The ip[" .. l_1_1.ip .. "] should get blocked, skipped due to audit mode"
  end
  return l_1_2
end

local l_0_1 = 0
local l_0_2 = 1
local l_0_3 = 2
local l_0_4 = 1
local l_0_5 = 2
local l_0_6 = 900
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  local l_0_7 = mp.CLEAN
  local l_0_8 = safeJsonDeserialize(this_sigattrlog[1].utf8p2)
  if not isnull(l_0_8) and l_0_8.ip and l_0_8.confidence and (l_0_8.determination == l_0_3 or l_0_8.determination == l_0_2) then
    l_0_8.context.attemptedFWBlock = false
    l_0_8.sessionInfo = reportSessionInformationInclusive()
    local l_0_9 = l_0_8.context
    if l_0_9 and tonumber(l_0_9.ForTest) == 1 then
      local l_0_10 = 1
      if tonumber(l_0_9.FWBlock) == l_0_10 then
        local l_0_11 = tonumber(l_0_8.action.parameter)
        local l_0_14, l_0_15 = pcall(bm.add_blocking_firewall_rule, l_0_8.ip, l_0_8.action.ttl or l_0_6, mp.bitand(l_0_11, l_0_4) == l_0_4, mp.bitand(l_0_11, l_0_5) == l_0_5, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION, true, false, "445")
        local l_0_18, l_0_19 = pcall(bm.add_blocking_firewall_rule, l_0_8.ip, l_0_8.action.ttl or l_0_6, mp.bitand(l_0_11, l_0_4) == l_0_4, mp.bitand(l_0_11, l_0_5) == l_0_5, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION, true, false, "139")
        l_0_8.context.attemptedFWBlock = true
        l_0_8.context.WFBlockSucceeded = l_0_14
        l_0_8.context.firewallBlockerror = tostring(l_0_15)
        l_0_8.context.WFBlockSucceeded2 = l_0_18
        l_0_8.context.firewallBlockerror2 = tostring(l_0_19)
        l_0_8.context.EDRMsg = l_0_0(l_0_8.UserConfig, l_0_8)
        if versioning.IsSeville() and (tonumber(l_0_9.notifyEDR) or tonumber(l_0_9.alertEDR)) then
          bm.set_detection_string(safeJsonSerialize(l_0_8))
        end
        l_0_7 = mp.INFECTED
      else
        l_0_8.client_reason = "CloudActionNoBlockNotset"
      end
    elseif isnull(l_0_9) then
      l_0_8.reason = "Error: context not found"
    elseif tonumber(l_0_9.ForTest) == 0 then
      l_0_8.reason = "Test is not enabled from cloud"
    end
  else
    local l_0_20 = {}
    if isnull(l_0_8) then
      l_0_20.error = "Error: Remote Data is empty"
      l_0_20.ip = "0.0.0.0"
      l_0_20.p1 = this_sigattrlog[1].utf8p1
      l_0_20.p2 = this_sigattrlog[1].utf8p2
      local l_0_21, l_0_22 = pcall(getBmInfo)
      if l_0_21 and l_0_22 then
        l_0_20.BmInfo = l_0_22
      end
      l_0_8 = l_0_20
    elseif l_0_8.determination == l_0_1 then
      l_0_8.reason = "CleanDetermination"
    end
    l_0_7 = mp.CLEAN
  end
  local l_0_23 = SafeGetUrlReputation({
    l_0_8.ip
  }, {
    SIG_CONTEXT = "BM",
    CONTEXT_SOURCE = "GenRansomRemoteFWReport",
    TAG = "NOLOOKUP",
    data = safeJsonSerialize(l_0_8)
  }, false, 3000, false)
  if l_0_23 and l_0_23.error == 3 then
    l_0_8.CRReportError = "Failed the first attempt"
    l_0_23 = SafeGetUrlReputation({
      l_0_8.ip
    }, {
      SIG_CONTEXT = "BM",
      CONTEXT_SOURCE = "GenRansomRemoteFWReport",
      TAG = "NOLOOKUP",
      data = safeJsonSerialize(l_0_8)
    }, false, 3000, false)
  end
  if l_0_7 == mp.INFECTED then
    return mp.INFECTED
  end
end
return mp.CLEAN
