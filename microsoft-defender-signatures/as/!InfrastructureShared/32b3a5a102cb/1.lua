-- Threat: !InfrastructureShared
-- Name: 32b3a5a102cb
-- Type: 21
-- Includes: LuaFuncHelper, PrecisionPulseHelpers

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 and this_sigattrlog[1].utf8p2 then
  local l_0_0 = string.match(this_sigattrlog[1].utf8p1, "statuscheck_(%d+)")
  if not l_0_0 then
    return mp.CLEAN
  end
  l_0_0 = tonumber(l_0_0)
  if l_0_0 < 0 then
    return mp.CLEAN
  end
  local l_0_1 = this_sigattrlog[1].utf8p2
  local l_0_2 = "hmdprecisionpulse"
  local l_0_3, l_0_4 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, "scan_completed_hmdprecisionpulsefullfilepathscan", l_0_2, l_0_1)
  if l_0_3 and l_0_4 then
    local l_0_5 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.update"
    local l_0_6 = {
      [1] = l_0_5
    }
    local l_0_7 = {
      SIG_CONTEXT = "BM_Custom_Update_Scan_Completed",
      CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE",
      TAG = "NOLOOKUP",
      FilePath = l_0_1,
      SigCounter = l_0_0
    }
    SafeGetUrlReputation(l_0_6, l_0_7, false, 2000)
    return mp.CLEAN
  elseif l_0_0 == 10 then
    local l_0_8 = sysio.GetFileSize(l_0_1)
    local l_0_9 = sysio.GetFileLastWriteTime(l_0_1)
    local l_0_10, l_0_11, l_0_12 = pcall(CollectFile, l_0_1, l_0_8, true)
    if l_0_10 and l_0_12 then
      l_0_12.FileSize = l_0_8
      l_0_12.FileLastWriteTime = l_0_9
      l_0_11 = l_0_11 or "NULL"
      pcall(ReportResource, l_0_1, l_0_11, l_0_12, "BM")
    end
  end
  if l_0_0 == 8 then
    pcall(ReportSupportLog)
  end
  l_0_3, l_0_4 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulseDebug", l_0_2, l_0_1)
  local l_0_13, l_0_14
  if l_0_3 and l_0_4 then
    l_0_13, l_0_14 = safeJsonSerialize(l_0_4, 150, nil, true)
  end
  local l_0_15 = "scan_counter"
  local l_0_16 = "max_scan"
  local l_0_17 = MpCommon.AtomicCounterValueNamespaced(l_0_15, l_0_2)
  local l_0_18 = MpCommon.AtomicCounterValueNamespaced(l_0_16, l_0_2)
  local l_0_19 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.update"
  local l_0_20 = {
    [1] = l_0_19
  }
  local l_0_21 = {
    SIG_CONTEXT = "BM_Custom_Update",
    CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE",
    TAG = "NOLOOKUP",
    FilePath = l_0_1,
    PrvScanInfo = l_0_13 or l_0_14,
    SigCounter = l_0_0,
    FileScanCounter = l_0_17,
    MaxFileScanCounter = l_0_18
  }
  local l_0_22 = false
  local l_0_23
  for l_0_24 = 0, 1 do
    local l_0_25 = 2000 + l_0_24 * 1000
    l_0_23 = SafeGetUrlReputation(l_0_20, l_0_21, false, l_0_25)
    if l_0_23 and l_0_23.urls and l_0_23.urls[l_0_19] and l_0_23.urls[l_0_19].determination == 4 then
      l_0_22 = true
      break
    end
  end
  if not l_0_22 then
    local l_0_26 = "[SigCounter:" .. l_0_0 .. "]CloudLookupFailed"
    pcall(AppendToRollingQueueNamespaced, "hmdprecisionpulseDebug", l_0_2, l_0_1, l_0_26, 3000, 500, 1)
  end
  if l_0_22 then
    if l_0_17 and l_0_18 and l_0_17 >= l_0_18 then
      MpCommon.AtomicCounterAddNamespaced(l_0_16, l_0_2, 1)
      local l_0_27 = "[SigCounter:" .. l_0_0 .. "]HmdMaxScanCounter hit " .. l_0_17 .. "|" .. l_0_18
      pcall(AppendToRollingQueueNamespaced, "hmdprecisionpulseDebug", l_0_2, l_0_1, l_0_27, 3000, 500, 1)
    end
    mp.TriggerScanResource("file", l_0_1, 0, 10000)
    local l_0_28 = "[SigCounter:" .. l_0_0 .. "]Issued a rescan!"
    pcall(AppendToRollingQueueNamespaced, "hmdprecisionpulseDebug", l_0_2, l_0_1, l_0_28, 3000, 500, 1)
  end
  l_0_0 = l_0_0 - 1
  if l_0_0 <= 0 then
    return mp.CLEAN
  end
  bm.trigger_sig_delayed("Report_hmdprecisionpulsefullfilepathscan_statuscheck_" .. l_0_0, l_0_1, 300000)
end
return mp.CLEAN
