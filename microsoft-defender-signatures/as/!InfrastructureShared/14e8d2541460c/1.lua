-- Threat: !InfrastructureShared
-- Name: 14e8d2541460c
-- Type: 21

local l_0_0 = MpCommon.PathToWin32Path(mp.getfilename(mp.FILEPATH_QUERY_FULL)):lower()
if l_0_0:find(".deb", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
