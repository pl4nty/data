-- Threat: !InfrastructureShared
-- Name: 85b3d3eed169
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
local l_0_1 = "\\w:\\\\windows\\\\(?:help|debug|inf|media)\\\\\\w+\\.exe\\s+.*\\w:\\\\windows\\\\(?:help|debug|inf|media)\\\\\\w+\\.dat\\s+.*\\:\\{[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}\\}"
local l_0_2 = false
l_0_2, _ = MpCommon.StringRegExpSearch(l_0_1, l_0_0)
if l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
