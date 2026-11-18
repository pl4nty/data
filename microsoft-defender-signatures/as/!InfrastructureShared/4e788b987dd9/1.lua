-- Threat: !InfrastructureShared
-- Name: 4e788b987dd9
-- Type: 21

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
local l_0_1 = string.match(l_0_0, "(.*)%.[^%.]+$")
local l_0_2 = l_0_0 .. ".ini"
if l_0_1 then
  l_0_2 = l_0_1 .. ".ini"
end
if sysio.IsFileExists(l_0_2) then
  mp.ReportLowfi(l_0_2, 1383809928)
end
return mp.INFECTED
