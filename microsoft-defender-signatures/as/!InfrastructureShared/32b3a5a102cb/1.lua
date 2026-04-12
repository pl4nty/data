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
  local l_0_3, l_0_4 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, "scan_completed_hmdprecisionpulsefullfilepathscan", l_0_2, l_0_1)
  local l_0_5 = {}
  local l_0_6 = nil
  if l_0_3 and l_0_4 then
    local l_0_7 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.update"
    local l_0_8 = {}
    l_0_8[1] = l_0_7
    local l_0_9 = {}
    l_0_9.SIG_CONTEXT = "BM_Custom_Update_Scan_Completed"
    l_0_9.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
    l_0_9.TAG = "NOLOOKUP"
    l_0_9.FilePath = l_0_1
    l_0_9.SigCounter = l_0_0
    SafeGetUrlReputation(l_0_8, l_0_9, false, 2000)
    return mp.CLEAN
  else
    do
      if l_0_0 == 10 then
        local l_0_10 = (sysio.GetFileSize)(l_0_1)
        local l_0_11 = (sysio.GetFileLastWriteTime)(l_0_1)
        l_0_5.FileSize = l_0_10
        l_0_5.FileLastWriteTime = l_0_11
        local l_0_12, l_0_13, l_0_14, l_0_15, l_0_16 = pcall(CollectFile, l_0_1, l_0_10)
        if l_0_12 then
          if l_0_13 then
            l_0_6 = l_0_13
            l_0_5.Sha1 = l_0_14
            l_0_5.Sha256 = l_0_15
            l_0_5.PartialSha1 = l_0_16
            l_0_5.PartialSha256 = 2000
          else
            l_0_5.Error_Facility = l_0_14
            l_0_5.Error_Code = l_0_15
          end
        end
      end
      do
        if l_0_0 == 8 then
          pcall(ReportSupportLog)
        end
        l_0_3 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulseDebug", l_0_2, l_0_1)
        local l_0_17, l_0_18 = nil, nil
        if l_0_3 and l_0_4 then
          l_0_17 = safeJsonSerialize(l_0_4, 150, nil, true)
        end
        local l_0_19 = "scan_counter"
        local l_0_20 = "max_scan"
        local l_0_21 = (MpCommon.AtomicCounterValueNamespaced)(l_0_19, l_0_2)
        local l_0_22 = (MpCommon.AtomicCounterValueNamespaced)(l_0_20, l_0_2)
        local l_0_23 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.update"
        local l_0_24 = {}
        l_0_24[1] = l_0_23
        local l_0_25 = {}
        l_0_25.SIG_CONTEXT = "BM_Custom_Update"
        l_0_25.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
        l_0_25.TAG = "NOLOOKUP"
        l_0_25.FilePath = l_0_1
        l_0_25.PrvScanInfo = l_0_17 or l_0_18
        l_0_25.SigCounter = l_0_0
        l_0_25.FileScanCounter = l_0_21
        l_0_25.MaxFileScanCounter = l_0_22
        l_0_25.FileReadInfo = safeJsonSerialize(l_0_5)
        l_0_25.Content = l_0_6
        local l_0_27 = false
        for l_0_31 = 0, 1 do
          local l_0_28 = nil
          -- DECOMPILER ERROR at PC166: Confused about usage of register: R21 in 'UnsetPending'

          l_0_28 = SafeGetUrlReputation(l_0_24, l_0_25, false, 2000 + R21_PC166 * 1000)
          if l_0_28 and l_0_28.urls and (l_0_28.urls)[l_0_23] and ((l_0_28.urls)[l_0_23]).determination == 4 then
            do
              do
                l_0_27 = true
                do break end
                -- DECOMPILER ERROR at PC191: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC191: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC191: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
        do
          if not l_0_27 then
            local l_0_33 = nil
            pcall(AppendToRollingQueueNamespaced, "hmdprecisionpulseDebug", l_0_2, l_0_1, "[SigCounter:" .. l_0_0 .. "]CloudLookupFailed", 3000, 500, 1)
          end
          if l_0_27 then
            if l_0_21 and l_0_22 and l_0_22 <= l_0_21 then
              (MpCommon.AtomicCounterAddNamespaced)(l_0_20, l_0_2, 1)
              local l_0_34 = nil
              pcall(AppendToRollingQueueNamespaced, "hmdprecisionpulseDebug", l_0_2, l_0_1, "[SigCounter:" .. l_0_0 .. "]HmdMaxScanCounter hit " .. l_0_21 .. "|" .. l_0_22, 3000, 500, 1)
            end
            do
              ;
              (mp.TriggerScanResource)("file", l_0_1, 0, 10000)
              do
                do
                  local l_0_35 = nil
                  pcall(AppendToRollingQueueNamespaced, "hmdprecisionpulseDebug", l_0_2, l_0_1, "[SigCounter:" .. l_0_0 .. "]Issued a rescan!", 3000, 500, 1)
                  l_0_0 = l_0_0 - 1
                  if l_0_0 <= 0 then
                    return mp.CLEAN
                  end
                  ;
                  (bm.trigger_sig_delayed)("Report_hmdprecisionpulsefullfilepathscan_statuscheck_" .. l_0_0, l_0_1, 300000)
                  -- DECOMPILER ERROR at PC274: freeLocal<0 in 'ReleaseLocals'

                  return mp.CLEAN
                end
              end
            end
          end
        end
      end
    end
  end
end

