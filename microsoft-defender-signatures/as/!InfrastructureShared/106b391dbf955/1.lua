-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\106b391dbf955\1.luac 

-- params : ...
-- function num : 0
local l_0_4, l_0_5 = nil, nil
do
  if (this_sigattrlog[2]).matched then
    local l_0_0, l_0_1, l_0_2, l_0_3 = this_sigattrlog[2], nil
  else
  end
  if (this_sigattrlog[3]).matched then
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

    if isnull((this_sigattrlog[3]).utf8p1) or isnull((this_sigattrlog[3]).utf8p2) then
      return mp.CLEAN
    end
    local l_0_6 = nil
    if isnull((bm.get_current_process_startup_info)()) or isnull(((bm.get_current_process_startup_info)()).ppid) then
      return mp.CLEAN
    end
    local l_0_7, l_0_8, l_0_9 = nil
    local l_0_10, l_0_11 = (string.match)(l_0_6.utf8p1, "imagename:(.+);targetprocessppid:(%d+):(%d+)$")
    -- DECOMPILER ERROR at PC79: Overwrote pending register: R10 in 'AssignReg'

    if isnull(l_0_10) or isnull(l_0_11) or isnull(R10_PC70) or isnull(R10_PC70) or isnull(R10_PC70) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC88: Overwrote pending register: R10 in 'AssignReg'

    local l_0_12 = nil
    -- DECOMPILER ERROR at PC92: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC93: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC96: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC97: Overwrote pending register: R10 in 'AssignReg'

    if R10_PC70 == 0 then
      return R10_PC70
    end
    -- DECOMPILER ERROR at PC99: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC100: Overwrote pending register: R10 in 'AssignReg'

    for l_0_16 = R10_PC70, 1, R12_PC91 do
      local l_0_13, l_0_14, l_0_15 = , (string.format)(R10_PC70, l_0_11, R12_PC91)
      -- DECOMPILER ERROR at PC105: Confused about usage of register: R13 in 'UnsetPending'

      -- DECOMPILER ERROR at PC116: Confused about usage of register: R14 in 'UnsetPending'

      -- DECOMPILER ERROR at PC120: Confused about usage of register: R14 in 'UnsetPending'

      -- DECOMPILER ERROR at PC124: Confused about usage of register: R14 in 'UnsetPending'

      -- DECOMPILER ERROR at PC128: Confused about usage of register: R14 in 'UnsetPending'

      -- DECOMPILER ERROR at PC133: Confused about usage of register: R14 in 'UnsetPending'

      do
        -- DECOMPILER ERROR at PC143: Unhandled construct in 'MakeBoolean' P1

        if (not l_0_7 or not l_0_8) and not isnull((sigattr_tail[R13_PC105]).attribute) and not isnull((sigattr_tail[R13_PC105]).utf8p1) and (sigattr_tail[R13_PC105]).attribute == 16427 and not isnull((sigattr_tail[R13_PC105]).np2) and (sigattr_tail[R13_PC105]).np2 >= 2031616 and not isnull((string.match)((sigattr_tail[R13_PC105]).utf8p1, "^..*\\(.+)$")) and l_0_10 == (string.match)((sigattr_tail[R13_PC105]).utf8p1, "^..*\\(.+)$") then
          l_0_7 = true
        end
        -- DECOMPILER ERROR at PC145: Confused about usage of register: R14 in 'UnsetPending'

        -- DECOMPILER ERROR at PC149: Confused about usage of register: R14 in 'UnsetPending'

        -- DECOMPILER ERROR at PC155: Confused about usage of register: R14 in 'UnsetPending'

        do
          if (sigattr_tail[R13_PC105]).attribute == 16497 and not isnull((sigattr_tail[R13_PC105]).utf8p2) then
            local l_0_19, l_0_21 = nil
            if not isnull((string.match)((sigattr_tail[R13_PC105]).utf8p2, "TargetPPID:(%d+):(%d+);TargetThreadID:(%d+)$")) and not isnull(R19_PC165) and not isnull(R19_PC165) and l_0_10 == l_0_21.utf8p1 and l_0_11 == (string.match)((sigattr_tail[R13_PC105]).utf8p2, "TargetPPID:(%d+):(%d+);TargetThreadID:(%d+)$") and l_0_12 == (sigattr_tail[R13_PC105]).utf8p2 then
              l_0_8 = 
            end
          end
          -- DECOMPILER ERROR at PC181: LeaveBlock: unexpected jumping out DO_STMT

        end
      end
    end
    if not l_0_7 or not l_0_8 then
      return mp.CLEAN
    end
    local l_0_22 = nil
    -- DECOMPILER ERROR at PC192: Confused about usage of register: R9 in 'UnsetPending'

    local l_0_23 = nil
    -- DECOMPILER ERROR at PC205: Overwrote pending register: R10 in 'AssignReg'

    if isnull((bm.get_process_relationships)(l_0_15)) or #(bm.get_process_relationships)(l_0_15) == 0 then
      for l_0_27,l_0_28 in pairs({}) do
        local l_0_24, l_0_25, l_0_26 = , false
        if ((sigattr_tail[R13_PC105]).utf8p2).ppid == l_0_9.ppid then
          l_0_25 = true
        end
      end
      -- DECOMPILER ERROR at PC217: Confused about usage of register: R10 in 'UnsetPending'

      if not l_0_25 then
        return mp.CLEAN
      end
      local l_0_29 = nil
      ;
      (bm.add_related_string)("ProcessHollowSummary", (string.format)("Injected at least %d bytes into %s (PID:%d) at %s", l_0_23, l_0_10, l_0_11, tostring(l_0_22)), bm.RelatedStringBMReport)
      TrackPidAndTechniqueBM(l_0_9.ppid, "T1055.012", "processhollow")
      TrackPidAndTechniqueBM(l_0_29, "T1055.012", "processhollow_target")
      ;
      (bm.trigger_sig_target_propagate)("CodeInjectTargeting", (string.format)("Process Hollow by %s", l_0_9.ppid), l_0_29)
      ;
      (bm.add_related_process)(l_0_29)
      AddSuspiciousRegion(l_0_22, l_0_29)
      return mp.INFECTED
    end
  end
end

