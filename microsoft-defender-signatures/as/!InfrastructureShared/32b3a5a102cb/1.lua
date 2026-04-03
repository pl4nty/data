-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3a5a102cb\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 and (this_sigattrlog[1]).utf8p2 then
  local l_0_0 = (string.match)((this_sigattrlog[1]).utf8p1, "statuscheck_(%d+)")
  if not l_0_0 then
    return mp.CLEAN
  end
  l_0_0 = tonumber(l_0_0)
  if l_0_0 < 0 then
    return mp.CLEAN
  end
  local l_0_1 = (this_sigattrlog[1]).utf8p2
  local l_0_2 = "hmdprecisionpulse"
  if pcall(MpCommon.RollingQueueQueryKeyNamespaced, "scan_completed_hmdprecisionpulsefullfilepathscan", l_0_2, l_0_1) and MpCommon.RollingQueueQueryKeyNamespaced then
    return mp.CLEAN
  end
  local l_0_4 = nil
  local l_0_3 = R4_PC63
  local l_0_5, l_0_6 = nil, nil
  if l_0_4 and l_0_3 then
    l_0_5 = safeJsonSerialize(l_0_3, 150, nil, true)
  end
  local l_0_7 = "scan_counter"
  local l_0_8 = "max_scan"
  local l_0_9 = (MpCommon.AtomicCounterValueNamespaced)(l_0_7, l_0_2)
  local l_0_10 = (MpCommon.AtomicCounterValueNamespaced)(l_0_8, l_0_2)
  local l_0_11 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.update"
  local l_0_12 = {}
  l_0_12[1] = l_0_11
  local l_0_13 = {}
  l_0_13.SIG_CONTEXT = "BM_Custom_Update"
  l_0_13.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
  l_0_13.TAG = "NOLOOKUP"
  l_0_13.FilePath = l_0_1
  l_0_13.PrvScanInfo = l_0_5 or l_0_6
  l_0_13.SigCounter = l_0_0
  l_0_13.FileScanCounter = l_0_9
  l_0_13.MaxFileScanCounter = l_0_10
  local l_0_15 = false
  for l_0_19 = 0, 1 do
    local l_0_16 = nil
    -- DECOMPILER ERROR at PC109: Confused about usage of register: R19 in 'UnsetPending'

    l_0_16 = SafeGetUrlReputation(l_0_12, l_0_13, false, 2000 + R19_PC109 * 1000)
    if l_0_16 and l_0_16.urls and (l_0_16.urls)[l_0_11] and ((l_0_16.urls)[l_0_11]).determination == 4 then
      do
        do
          l_0_15 = true
          do break end
          -- DECOMPILER ERROR at PC134: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC134: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC134: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  do
    if not l_0_15 then
      local l_0_21 = nil
      pcall(AppendToRollingQueueNamespaced, "hmdprecisionpulseDebug", l_0_2, l_0_1, "[SigCounter:" .. l_0_0 .. "]CloudLookupFailed", 3000, 500, 1)
    end
    if l_0_15 then
      if l_0_9 and l_0_10 and l_0_10 <= l_0_9 then
        (MpCommon.AtomicCounterAddNamespaced)(l_0_8, l_0_2, 1)
        local l_0_22 = nil
        pcall(AppendToRollingQueueNamespaced, "hmdprecisionpulseDebug", l_0_2, l_0_1, "[SigCounter:" .. l_0_0 .. "]HmdMaxScanCounter hit " .. l_0_9 .. "|" .. l_0_10, 3000, 500, 1)
      end
      do
        ;
        (mp.TriggerScanResource)("file", l_0_1, 0, 10000)
        do
          do
            local l_0_23 = nil
            pcall(AppendToRollingQueueNamespaced, "hmdprecisionpulseDebug", l_0_2, l_0_1, "[SigCounter:" .. l_0_0 .. "]Issued a rescan!", 3000, 500, 1)
            l_0_0 = l_0_0 - 1
            if l_0_0 <= 0 then
              return mp.CLEAN
            end
            ;
            (bm.trigger_sig_delayed)("Report_hmdprecisionpulsefullfilepathscan_statuscheck_" .. l_0_0, l_0_1, 300000)
            -- DECOMPILER ERROR at PC217: freeLocal<0 in 'ReleaseLocals'

            return mp.CLEAN
          end
        end
      end
    end
  end
end

