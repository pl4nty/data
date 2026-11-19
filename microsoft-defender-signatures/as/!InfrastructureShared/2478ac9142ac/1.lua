-- Threat: !InfrastructureShared
-- Name: 2478ac9142ac
-- Type: 21

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
local l_0_1 = l_0_0:match("^(.*\\)")
local l_0_2 = l_0_1 .. "log.cached"
if sysio.IsFileExists(l_0_2) then
  mp.ReportLowfi(l_0_2, 3952868898)
end
return mp.INFECTED
