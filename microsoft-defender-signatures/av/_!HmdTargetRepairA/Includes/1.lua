-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!HmdTargetRepairA\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "hmdprecisionpulse"
local l_0_1 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_FILEPATH))
local l_0_2 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME))
local l_0_3 = (string.format)("%s\\%s", l_0_1, l_0_2)
if pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulseregkeyvaluescan", l_0_0, l_0_3) and MpCommon.RollingQueueQueryKeyNamespaced then
  return mp.INFECTED
end
return mp.CLEAN

