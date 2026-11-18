-- Threat: \xac!HmdTargetRepair.A
-- Type: 13
-- MpAttributes: /MpIsRegKeyValueScan

local l_0_0 = "hmdprecisionpulse"
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
local l_0_3 = string.format("%s\\\\%s", l_0_1, l_0_2)
local l_0_4, l_0_5 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulseregkeyvaluescan", l_0_0, l_0_3)
if l_0_4 and l_0_5 then
  return mp.INFECTED
end
return mp.CLEAN
