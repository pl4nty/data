-- Threat: !InfrastructureShared
-- Name: 8178371ae482
-- Type: 21

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_0 == nil or l_0_0 == "" then
  return mp.INFECTED
end
local l_0_1 = string.match(l_0_0, "^(.*[/\\])") or ""
local l_0_2 = "sdraw.dat"
local l_0_3 = l_0_1 .. l_0_2
if sysio.IsFileExists(l_0_3) then
  mp.ReportLowfi(l_0_3, 4252275679)
end
return mp.INFECTED
