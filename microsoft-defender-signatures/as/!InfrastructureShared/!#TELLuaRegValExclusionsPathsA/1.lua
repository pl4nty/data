-- Threat: !InfrastructureShared
-- Name: !#TEL:Lua:RegValExclusionsPaths.A
-- Type: 13

local l_0_0 = mp.getfilename()
local l_0_1 = string.lower(l_0_0)
if (l_0_1:find("hklm\\software\\microsoft\\windows defender\\exclusions\\paths\\", 1, true) or l_0_1:find("hklm\\software\\microsoft\\microsoft antimalware\\exclusions\\paths\\", 1, true)) and string.sub(l_0_1, -1) == "\\" and string.sub(l_0_1, -2) ~= ":\\" and string.find(l_0_0, "WTT 2.2\\Client\\", 1, true) == nil then
  return mp.INFECTED
end
return mp.CLEAN
