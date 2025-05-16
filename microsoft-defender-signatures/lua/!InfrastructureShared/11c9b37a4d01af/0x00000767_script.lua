-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\11c9b37a4d01af\0x00000767_luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[47]).matched then
    local l_0_0, l_0_1 = (this_sigattrlog[47]).utf8p2
  end
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_2 = nil
  if not (this_sigattrlog[47]).ppid then
    return mp.CLEAN
  end
  local l_0_3 = nil
  if not GetRollingQueueKeyValues("gpo_schtasks", l_0_2) then
    return mp.CLEAN
  end
  for l_0_7,l_0_8 in ipairs(GetRollingQueueKeyValues("gpo_schtasks", l_0_2)) do
    local l_0_4 = nil
    -- DECOMPILER ERROR at PC37: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (bm.add_related_string)("RemoteInvocation:GPO", R7_PC37.value, bm.RelatedStringBMReport)
    ;
    (MpCommon.BmTriggerSigPropagate)(l_0_3, "RemoteInvocation:GPO", R7_PC37.value)
    ;
    (MpCommon.AddProcessAttribute)(l_0_3, "RemoteInvocation:GPO", l_0_2, true)
  end
  return mp.INFECTED
end

