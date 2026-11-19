-- Threat: !InfrastructureShared
-- Name: 5e6149ecb8e9
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 and l_0_1 then
  AppendToRollingQueue("scrobj.dll", l_0_1, l_0_0)
end
return mp.INFECTED
