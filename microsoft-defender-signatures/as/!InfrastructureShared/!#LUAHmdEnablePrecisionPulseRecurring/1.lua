-- Threat: !InfrastructureShared
-- Name: !#LUA:HmdEnablePrecisionPulseRecurring
-- Type: 12
-- Includes: PrecisionPulseHelpers, LuaFuncHelper

if MpCommon.NidSearch(mp.NID_ENABLE_EXTENDED_BAFS, 7) then
  local r0_0, r0_1, r0_2, r0_3, r0_4, r0_5 = "hmdprecisionpulse", "scan_counter", "max_scan", "run_tracker", 60, 500
  local r0_6 = MpCommon.AtomicCounterValueNamespaced(r0_3, r0_0)
  if r0_6 ~= nil then
    return mp.CLEAN
  end
  local r0_7 = MpCommon.AtomicCounterValueNamespaced(r0_1, r0_0)
  if r0_7 == nil then
    MpCommon.AtomicCounterSetNamespaced(r0_1, r0_0, 0, r0_4)
  end
  local r0_8 = MpCommon.AtomicCounterValueNamespaced(r0_2, r0_0)
  if r0_8 == nil then
    MpCommon.AtomicCounterSetNamespaced(r0_2, r0_0, r0_5, r0_4)
  end
  if r0_6 == nil then
    pcall(MpCommon.AtomicCounterSetNamespaced(r0_3, r0_0, 1, r0_4))
  end
  local r0_9 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.info"
  local r0_10 = { [1] = r0_9 }
  local r0_11 = {
    SIG_CONTEXT = "LUA_GENERIC", CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE", TAG = "NOLOOKUP"
  }
  local r0_12 = SafeGetUrlReputation(r0_10, r0_11, false, 4000)
  if r0_12 and r0_12.error == 3 then
    r0_11.CRReportError = "Failed the first attempt"
    r0_12 = SafeGetUrlReputation(r0_10, r0_11, false, 4000)
    if r0_12 and r0_12.error then
      return mp.CLEAN
    end
  end
  for r0_13, r0_14 in pairs(r0_12.urls) do
    if r0_14.determination == 4 then
      local r0_15 = r0_14.context
      local r0_16 = ""
      if r0_15 then
        for r0_17, r0_18 in pairs(r0_15) do
          if r0_17 == "Payload" then
            r0_16 = r0_18
            local r0_19, r0_20 = pcall(EnablePrecisionPulse, r0_16,
              "HmdEnablePrecisionPulseRecurring", r0_0, r0_1, r0_2)
            if r0_20 then
              local r0_21 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.report"
              local r0_22 = { [1] = r0_21 }
              local r0_23 = {
                SIG_CONTEXT = "LUA_GENERIC", CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE",
                TAG = "NOLOOKUP", Report_Error = r0_20
              }
              SafeGetUrlReputation(r0_22, r0_23, false, 4000)
            end
            break
          end
        end
      end
    end
  end
end
return mp.CLEAN
