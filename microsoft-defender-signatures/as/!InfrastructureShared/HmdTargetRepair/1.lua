-- Threat: !InfrastructureShared
-- Name: HmdTargetRepair
-- Type: 15
-- Includes: LuaFuncHelper

local l_0_0 = "hmdprecisionpulse"
for l_0_1, l_0_2 in ipairs(Remediation.Threat.Resources) do
  local l_0_3 = l_0_2.Path
  local l_0_4, l_0_5 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulseregkeyvaluescan", l_0_0, l_0_3)
  if l_0_4 and l_0_5 then
    local l_0_6 = split(l_0_3:gsub("\\\\", "#DELIM#"), "#DELIM#")
    if l_0_6 ~= nil and #l_0_6 == 2 then
      local l_0_7 = l_0_6[1]
      local l_0_8 = l_0_6[2]
      local l_0_9 = sysio.RegOpenKey(l_0_7)
      if l_0_9 ~= nil then
        sysio.DeleteRegValue(l_0_9, l_0_8)
      end
    end
  end
end
