-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\HmdTargetRepair\0x00001802_luac 

-- params : ...
-- function num : 0
local l_0_0 = "hmdprecisionpulse"
for l_0_4,l_0_5 in ipairs((Remediation.Threat).Resources) do
  local l_0_6 = l_0_5.Path
  local l_0_7, l_0_8 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulseregkeyvaluescan", l_0_0, l_0_6)
  if l_0_7 and l_0_8 then
    local l_0_9 = split(l_0_6:gsub("\\\\", "#DELIM#"), "#DELIM#")
    if l_0_9 ~= nil and #l_0_9 == 2 then
      local l_0_10 = l_0_9[1]
      local l_0_11 = l_0_9[2]
      local l_0_12 = (sysio.RegOpenKey)(l_0_10)
      if l_0_12 ~= nil then
        (sysio.DeleteRegValue)(l_0_12, l_0_11)
      end
    end
  end
end

