-- Threat: !InfrastructureShared
-- Name: 32b36ba2057c
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = "1bb146aa"
if this_sigattrlog[1].matched and not isnull(this_sigattrlog[1].utf8p2) then
  local l_0_1 = safeJsonDeserialize(this_sigattrlog[1].utf8p2)
  local l_0_2 = "app_ext_" .. l_0_1.Extension
  local l_0_3 = MpCommon.AtomicCounterValueExNamespaced(l_0_2, l_0_0)
  if l_0_3 ~= nil then
    l_0_1.ACDelayedFilesEncrypted = l_0_3.count
    l_0_1.ACDelayedCreationTime = l_0_3.insert_time
    l_0_1.ACDelayedExpirationTime = l_0_3.expire_time
    l_0_1.ACDelayedRecentTime = l_0_3.update_time
    local l_0_4 = MpCommon.AtomicCounterValueNamespaced("rcount_sig_count", l_0_0)
    if l_0_4 ~= nil then
      l_0_1.SigCounter = l_0_4
    else
      l_0_1.SigCounter = 0
    end
    if l_0_1.DelayedTriggerCount then
      l_0_1.DelayedTriggerCount = l_0_1.DelayedTriggerCount + 1
    end
    local l_0_5 = safeJsonSerialize(l_0_1)
    local l_0_6 = SafeGetUrlReputation({
      l_0_1.ip
    }, {
      SIG_CONTEXT = "BM",
      CONTEXT_SOURCE = "GenRansomData3",
      TAG = "NOLOOKUP",
      data = l_0_5
    }, false, 3000, false)
    if l_0_6 and l_0_6.error == 3 then
      l_0_1.CRReportError = "Failed the first attempt"
      l_0_6 = SafeGetUrlReputation({
        l_0_1.ip
      }, {
        SIG_CONTEXT = "BM",
        CONTEXT_SOURCE = "GenRansomData3",
        TAG = "NOLOOKUP",
        data = l_0_5
      }, false, 3000, false)
    end
    local l_0_7 = 6
    if l_0_1.DelayedTriggerCount and l_0_7 > l_0_1.DelayedTriggerCount then
      bm.trigger_sig_delayed("RemoteGenericRansomwareDelay:Type2", l_0_5, 570000)
    end
  end
end
return mp.CLEAN
