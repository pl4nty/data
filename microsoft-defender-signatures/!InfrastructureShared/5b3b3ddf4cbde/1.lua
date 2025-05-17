-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5b3b3ddf4cbde\1.luac 

-- params : ...
-- function num : 0
if mp.SIGATTR_LOG_SZ == 0 then
  return mp.CLEAN
end
for l_0_3 = mp.SIGATTR_LOG_SZ, 1, -1 do
  local l_0_4 = sigattr_tail[l_0_3]
  if l_0_4.matched and l_0_4.attribute == 16393 and l_0_4.utf8p1 then
    local l_0_5 = (string.lower)(l_0_4.utf8p1)
    local l_0_6 = false
    local l_0_7 = "hklm\\\\software(\\\\policies)?\\\\microsoft\\\\(windows defender|microsoft antimalware)\\\\exclusions\\\\(path|extensions)"
    l_0_6 = (MpCommon.StringRegExpSearch)(l_0_7, l_0_5)
    if l_0_6 then
      local l_0_8 = (bm.get_current_process_startup_info)()
      if not l_0_8 or not l_0_8.ppid then
        return mp.CLEAN
      end
      local l_0_9 = false
      local l_0_10 = (mp.GetProcessCommandLine)(l_0_8.ppid)
      if l_0_10 and contains(l_0_10, "gpsvc") then
        l_0_9 = true
      else
        local l_0_11 = {}
        local l_0_12 = {}
        -- DECOMPILER ERROR at PC68: No list found for R12 , SetList fails

        -- DECOMPILER ERROR at PC69: No list found for R11 , SetList fails

        -- DECOMPILER ERROR at PC71: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC72: Overwrote pending register: R14 in 'AssignReg'

        l_0_12 = l_0_12("svchost.exe", "GPSvc", 5)
        l_0_9 = l_0_12
      end
      do
        local l_0_13 = l_0_5:match("\\\\(.*)")
        local l_0_14 = IsKeyInRollingQueue("gpo_broad_exclusion", l_0_13, true)
        do
          if not (bm.get_imagepath)() then
            local l_0_15, l_0_16, l_0_17, l_0_22 = l_0_8.image_path
          end
          -- DECOMPILER ERROR at PC90: Confused about usage of register: R13 in 'UnsetPending'

          if not l_0_15 then
            return mp.CLEAN
          end
          -- DECOMPILER ERROR at PC95: Confused about usage of register: R13 in 'UnsetPending'

          -- DECOMPILER ERROR at PC98: Confused about usage of register: R13 in 'UnsetPending'

          if l_0_15 and contains(l_0_15, "svchost.exe") then
            local l_0_18 = nil
            local l_0_19 = l_0_5
            local l_0_20 = 86400
            local l_0_21 = (MpCommon.AtomicCounterValue)(l_0_19)
            if not l_0_21 then
              (MpCommon.AtomicCounterSet)(l_0_19, 1, l_0_20)
              add_parents()
              ;
              (bm.add_related_string)("AppliedThroughPolicy", safeJsonSerialize({has_gpsvc_cmd = tostring(l_0_9), has_rq_gpo = tostring(l_0_14), count = l_0_21, key = l_0_19}), bm.RelatedStringBMReport)
            else
              if l_0_21 and l_0_21 < 5 then
                (MpCommon.AtomicCounterAdd)(l_0_19, 1)
                add_parents()
                -- DECOMPILER ERROR at PC155: Confused about usage of register: R17 in 'UnsetPending'

                ;
                (bm.add_related_string)("AppliedThroughPolicy", safeJsonSerialize({has_gpsvc_cmd = tostring(l_0_9), has_rq_gpo = tostring(l_0_14), count = l_0_21, key = l_0_19}), bm.RelatedStringBMReport)
              else
                ;
                (MpCommon.AtomicCounterAdd)(l_0_19, 1)
                return mp.CLEAN
              end
            end
            if l_0_14 then
              return mp.INFECTED
            else
              ;
              (bm.trigger_sig)("Wide_Exclusion_Existing_Policy", l_0_5)
              return mp.CLEAN
            end
          else
            do
              do
                add_parents()
                do return mp.INFECTED end
                -- DECOMPILER ERROR at PC189: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC189: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC189: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC189: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC189: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC189: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC189: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC189: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC189: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN

