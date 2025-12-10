-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b38b431a97\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12 = nil, nil
do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
    local l_0_2 = nil
    if not (this_sigattrlog[1]).utf8p2 then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R2 in 'UnsetPending'

    _ = (MpCommon.StringRegExpSearch)("(?i)binPath=[\\s\'\\\"\\\\]+(.*\\.\\w+)", (this_sigattrlog[1]).utf8p2)
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

  end
  if not l_0_2 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

  AppendToRollingQueue("NewlyRegisteredServices", l_0_2, true, 3600, 20)
  -- DECOMPILER ERROR at PC49: Confused about usage of register: R1 in 'UnsetPending'

  if ((string.lower)((this_sigattrlog[1]).utf8p2)):match("create(.*)binpath") then
    AppendToRollingQueue("NewlyRegisteredServices_Name", ((string.lower)((this_sigattrlog[1]).utf8p2)):match("create(.*)binpath"), true, 3600, 20)
  end
  return mp.CLEAN
end

