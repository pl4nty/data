-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3a5a102cb\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  local l_0_0 = (this_sigattrlog[1]).utf8p2
  local l_0_1 = "hmdprecisionpulse"
  local l_0_2, l_0_3 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, "scan_completed_hmdprecisionpulsefullfilepathscan", l_0_1, l_0_0)
  if l_0_2 and l_0_3 then
    return mp.CLEAN
  end
  local l_0_4 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.update"
  local l_0_5 = {}
  l_0_5[1] = l_0_4
  local l_0_6 = {}
  l_0_6.SIG_CONTEXT = "BM_Custom_Update"
  l_0_6.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
  l_0_6.TAG = "NOLOOKUP"
  l_0_6.FilePath = l_0_0
  local l_0_7 = SafeGetUrlReputation(l_0_5, l_0_6, false, 2000)
  local l_0_8 = false
  if (l_0_7.urls)[l_0_4] and ((l_0_7.urls)[l_0_4]).determination == 4 then
    l_0_8 = true
  else
    l_0_7 = SafeGetUrlReputation(l_0_5, l_0_6, false, 5000)
    if (l_0_7.urls)[l_0_4] and ((l_0_7.urls)[l_0_4]).determination == 4 then
      l_0_8 = true
    end
  end
  if l_0_8 then
    local l_0_9 = "scan_counter"
    local l_0_10 = "max_scan"
    local l_0_11 = (MpCommon.AtomicCounterValueNamespaced)(l_0_9, l_0_1)
    local l_0_12 = (MpCommon.AtomicCounterValueNamespaced)(l_0_10, l_0_1)
    if l_0_11 and l_0_12 and l_0_12 <= l_0_11 then
      return mp.CLEAN
    end
    ;
    (mp.TriggerScanResource)("file", l_0_0, 0, 10000)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

