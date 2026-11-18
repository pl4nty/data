-- Threat: !InfrastructureShared
-- Name: 12b78a3f872da
-- Type: 21

local l_0_0 = mp.getfilesize()
if 4000000 < l_0_0 or l_0_0 < 10000 then
  return mp.CLEAN
end
local l_0_1 = MpCommon.ExpandEnvironmentVariables("%windir%"):lower()
if MpCommon.PathToWin32Path(mp.getfilename(mp.FILEPATH_QUERY_FULL)):lower():sub(1, #l_0_1) == l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
