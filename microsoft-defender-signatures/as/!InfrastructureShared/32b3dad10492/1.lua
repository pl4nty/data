-- Threat: !InfrastructureShared
-- Name: 32b3dad10492
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if this_sigattrlog[1].matched and not isnull(this_sigattrlog[1].utf8p2) then
  local l_0_0 = safeJsonDeserialize(this_sigattrlog[1].utf8p2)
  if l_0_0 and l_0_0.context and tonumber(l_0_0.context.ForTest) == 1 then
    local l_0_1 = l_0_0.context
    local l_0_2 = 0
    local l_0_3 = 1
    local l_0_4 = 2
    local l_0_5, l_0_6
    l_0_5, l_0_6 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
    if not l_0_5 or not l_0_6 then
      l_0_6 = {
        State = 0,
        MaxTimeout = 0,
        Exclusions = "",
        AggressiveLevel = 0
      }
      l_0_0.client_error = "Failed to get data from user config, setting default configuration"
    end
    l_0_0.UserConfig = l_0_6
    l_0_0.context.attemptedFWBlock = false
    l_0_0.sessionInfo = reportSessionInformationInclusive()
    local l_0_7 = mp.CLEAN
    local l_0_8 = tonumber(l_0_1.FWBlock)
    local l_0_9
    if not isnull(l_0_6.Exclusions) then
      local l_0_10 = split(l_0_6.Exclusions, "|")
      l_0_10 = convert_to_hashtable(l_0_10)
    end
    local l_0_11 = isIPInExclusionList(l_0_0.ip, l_0_9, true)
    if l_0_11 == true then
      l_0_0.client_reason = "The ip [" .. l_0_0.ip .. "] is in excluded list"
      if l_0_8 == l_0_3 then
        l_0_0.client_reason = "Remote encryption would have blocked but the ip [" .. l_0_0.ip .. "] is in excluded list"
      elseif l_0_8 == l_0_4 then
        l_0_0.client_reason = "Remote encryption configuration is in audit mode and the ip [" .. l_0_0.ip .. "] is in excluded list, Otheriwse it would have been blocked"
      end
    else
      if l_0_8 == l_0_2 then
        l_0_0.client_reason = "CloudNoBlock"
        if versioning.IsSeville() and tonumber(l_0_1.notifyEDR) then
          bm.set_detection_string(safeJsonSerialize(l_0_0))
        end
      elseif l_0_8 == l_0_3 then
        if l_0_6.State == MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_ENABLED then
          bm.trigger_sig("GenericRansomwareRemoteEncryption", this_sigattrlog[1].utf8p2)
          return mp.CLEAN
        else
          l_0_0.client_reason = "CloudAsksBlockButUserConfigStateDiffers:" .. tostring(l_0_6.State)
        end
      elseif l_0_8 == l_0_4 then
        if versioning.IsSeville() and tonumber(l_0_1.notifyEDR) then
          bm.set_detection_string(safeJsonSerialize(l_0_0))
        end
        l_0_0.client_reason = "UserConfigAuditMode"
      end
      l_0_7 = mp.INFECTED
    end
    local l_0_12 = SafeGetUrlReputation({
      l_0_0.ip
    }, {
      SIG_CONTEXT = "BM",
      CONTEXT_SOURCE = "GenRansomRemoteFWReport",
      TAG = "NOLOOKUP",
      data = safeJsonSerialize(l_0_0)
    }, false, 3000, false)
    if l_0_12 and l_0_12.error == 3 then
      l_0_0.CRReportError = "Failed the first attempt"
      l_0_12 = SafeGetUrlReputation({
        l_0_0.ip
      }, {
        SIG_CONTEXT = "BM",
        CONTEXT_SOURCE = "GenRansomRemoteFWReport",
        TAG = "NOLOOKUP",
        data = safeJsonSerialize(l_0_0)
      }, false, 3000, false)
    end
    if l_0_7 == mp.INFECTED then
      return mp.INFECTED
    end
  else
    l_0_0.ppID = nil
    l_0_0.imagePath = nil
    l_0_0.sessionInfo = reportSessionInformationInclusive()
    if versioning.IsSeville() then
      bm.set_detection_string(safeJsonSerialize(l_0_0))
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
