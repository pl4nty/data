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
  local l_0_7 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.update"
  local l_0_8 = {}
  l_0_8[1] = l_0_7
  local l_0_9 = {}
  l_0_9.SIG_CONTEXT = "BM_Custom_Update"
  l_0_9.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
  l_0_9.TAG = "NOLOOKUP"
  l_0_9.FilePath = l_0_1
  l_0_9.PrvScanInfo = l_0_5 or l_0_6
  l_0_9.SigCounter = l_0_0
  local l_0_11 = false
  for l_0_15 = 0, 3 do
    local l_0_12 = nil
    -- DECOMPILER ERROR at PC95: Confused about usage of register: R15 in 'UnsetPending'

    l_0_12 = SafeGetUrlReputation(l_0_8, l_0_9, false, 2000 + R15_PC95 * 1000)
    if l_0_12 and l_0_12.urls and (l_0_12.urls)[l_0_7] and ((l_0_12.urls)[l_0_7]).determination == 4 then
      do
        do
          l_0_11 = true
          do break end
          -- DECOMPILER ERROR at PC120: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC120: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC120: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  do
    if not l_0_11 then
      local l_0_17 = nil
      pcall(AppendToRollingQueueNamespaced, "hmdprecisionpulseDebug", l_0_2, l_0_1, "[SigCounter:" .. l_0_0 .. "]CloudLookupFailed", 3000, 500, 1)
      return mp.CLEAN
    end
    if l_0_11 then
      local l_0_18 = nil
      local l_0_19 = "scan_counter"
      local l_0_20 = "max_scan"
      local l_0_21 = (MpCommon.AtomicCounterValueNamespaced)(l_0_19, l_0_2)
      do
        if l_0_21 and (MpCommon.AtomicCounterValueNamespaced)(l_0_20, l_0_2) and (MpCommon.AtomicCounterValueNamespaced)(l_0_20, l_0_2) <= l_0_21 then
          local l_0_22 = nil
          pcall(AppendToRollingQueueNamespaced, "hmdprecisionpulseDebug", l_0_2, l_0_1, "[SigCounter:" .. l_0_0 .. "]HmdMaxScanCounter hit " .. l_0_21 .. "|" .. (MpCommon.AtomicCounterValueNamespaced)(l_0_20, l_0_2), 3000, 500, 1)
        end
        ;
        (mp.TriggerScanResource)("file", l_0_1, 0, 10000)
        do
          do
            local l_0_23 = nil
            pcall(AppendToRollingQueueNamespaced, "hmdprecisionpulseDebug", l_0_2, l_0_1, "[SigCounter:" .. l_0_0 .. "]Issued a rescan!", 3000, 500, 1)
            do return mp.CLEAN end
            l_0_0 = l_0_0 - 1
            if l_0_0 <= 0 then
              return mp.CLEAN
            end
            ;
            (bm.trigger_sig_delayed)("Report_hmdprecisionpulsefullfilepathscan_statuscheck_" .. l_0_0, l_0_1, 300000)
            -- DECOMPILER ERROR at PC215: freeLocal<0 in 'ReleaseLocals'

            return mp.CLEAN
          end
        end
      end
    end
  end
end

