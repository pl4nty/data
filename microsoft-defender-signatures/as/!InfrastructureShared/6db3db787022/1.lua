-- Threat: !InfrastructureShared
-- Name: 6db3db787022
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = "net\\s+use\\s+(?<drive>\\w):\\s+\\\\\\\\\\w{2,5}\\.si@ssl\\\\\\w{1,3}\\s+\\&\\&\\s+(?:C:\\\\WINDOWS\\\\system32\\\\|C:\\\\WINDOWS\\\\syswow64\\\\)?rundll32(?:\\.exe)?\\s(?:\\k<drive>)\\:\\\\\\w\\\\\\w\\.dll,[\\%\\w+\\%]+"
local l_0_2 = false
l_0_2, _ = MpCommon.StringRegExpSearch(l_0_1, l_0_0)
if l_0_2 == false then
  return mp.CLEAN
end
return mp.INFECTED
