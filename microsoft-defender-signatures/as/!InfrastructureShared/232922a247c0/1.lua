-- Threat: !InfrastructureShared
-- Name: 232922a247c0
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = false
local l_0_1 = mp.GetBruteMatchData()
local l_0_2 = l_0_1.match_offset + 1
local l_0_3 = l_0_1.match_offset + 1 + 512
local l_0_4 = tostring(l_0_1.is_header and headerpage or footerpage):sub(l_0_2, l_0_3):lower()
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = mp.GetExecutablesFromCommandLine(l_0_4)
for l_0_6, l_0_7 in ipairs(l_0_5) do
  if sysio.IsFileExists(l_0_7) and not mp.IsKnownFriendlyFile(l_0_7, false, false) and string.find(l_0_7, ".dll", -4, true) then
    mp.ReportLowfi(l_0_7, 3071065115)
    AppendToRollingQueue("SuspTransportAgent", l_0_7, 1, 86400, 10)
    l_0_0 = true
  end
end
if l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
