-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\117b3c84b183d\0x00000430_luac 

-- params : ...
-- function num : 0
local l_0_6 = nil
do
  if (this_sigattrlog[2]).matched then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5 = this_sigattrlog[2], nil
  else
  end
  if (this_sigattrlog[3]).matched then
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

    if isnull((this_sigattrlog[3]).utf8p1) or isnull((this_sigattrlog[3]).utf8p2) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

    local l_0_7, l_0_8, l_0_9 = , (string.match)((this_sigattrlog[3]).utf8p1, "imagename:(.+);targetprocessppid:(%d+):(%d+)$")
    local l_0_10, l_0_11 = nil
    if isnull(l_0_9) or isnull(l_0_10) or isnull(l_0_11) or isnull((string.match)(l_0_7.utf8p2, "vmbaseaddress:(.+);[a-z]-regionsize:(%d+);")) or isnull(R8_PC64) then
      return mp.CLEAN
    end
    if mp.SIGATTR_LOG_SZ == 0 then
      return mp.CLEAN
    end
    for l_0_15 = mp.SIGATTR_LOG_SZ, R8_PC64, -1 do
      local l_0_12, l_0_13 = nil
      -- DECOMPILER ERROR at PC83: Confused about usage of register: R10 in 'UnsetPending'

      -- DECOMPILER ERROR at PC92: Confused about usage of register: R11 in 'UnsetPending'

      -- DECOMPILER ERROR at PC97: Confused about usage of register: R11 in 'UnsetPending'

      -- DECOMPILER ERROR at PC101: Confused about usage of register: R11 in 'UnsetPending'

      -- DECOMPILER ERROR at PC104: Confused about usage of register: R11 in 'UnsetPending'

      -- DECOMPILER ERROR at PC109: Confused about usage of register: R11 in 'UnsetPending'

      if not l_0_8 and not isnull((sigattr_tail[R10_PC83]).attribute) and not isnull((sigattr_tail[R10_PC83]).utf8p1) and not isnull((sigattr_tail[R10_PC83]).np2) and (sigattr_tail[R10_PC83]).attribute == 16427 and (sigattr_tail[R10_PC83]).np2 >= 2031616 and not isnull((string.match)((sigattr_tail[R10_PC83]).utf8p1, "^..*\\(.+)$")) and l_0_9 == (string.match)((sigattr_tail[R10_PC83]).utf8p1, "^..*\\(.+)$") then
        l_0_8 = true
      end
    end
    if not l_0_8 then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC129: Confused about usage of register: R6 in 'UnsetPending'

    -- DECOMPILER ERROR at PC133: Confused about usage of register: R5 in 'UnsetPending'

    local l_0_18 = nil
    ;
    (bm.add_related_string)("CodeInjectSummary", (string.format)("Injected at least %d bytes into %s (PID:%d) at %s", l_0_13, l_0_9, l_0_10, tostring(l_0_12)), bm.RelatedStringBMReport)
    local l_0_19 = nil
    if not isnull((bm.get_current_process_startup_info)()) and not isnull(((bm.get_current_process_startup_info)()).ppid) then
      TrackPidAndTechniqueBM(((bm.get_current_process_startup_info)()).ppid, "T1055", "processinjection")
    end
    local l_0_20 = nil
    TrackPidAndTechniqueBM((string.format)("pid:%d,ProcessStart:%d", l_0_10, l_0_11), "T1055", "processinjection_target")
    ;
    (bm.add_related_process)((string.format)("pid:%d,ProcessStart:%d", l_0_10, l_0_11))
    TriggerTargetedMemoryScan(l_0_18, (string.format)("pid:%d,ProcessStart:%d", l_0_10, l_0_11))
    AddSuspiciousRegion(l_0_18, (string.format)("pid:%d,ProcessStart:%d", l_0_10, l_0_11))
    return mp.INFECTED
  end
end

