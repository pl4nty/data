-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b38b431a97\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_2, l_0_3, l_0_4 = nil
do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
    local l_0_1 = nil
    _ = (MpCommon.StringRegExpSearch)("(?i)binPath=[\\s\'\\\"\\\\]+(.*\\.\\w+)", (this_sigattrlog[1]).utf8p2)
  end
  if not l_0_1 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R0 in 'UnsetPending'

  AppendToRollingQueue("NewlyRegisteredServices", l_0_1, true, 3600, 20)
  return mp.CLEAN
end

