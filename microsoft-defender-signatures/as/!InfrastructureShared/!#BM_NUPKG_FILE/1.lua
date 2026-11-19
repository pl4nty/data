-- Threat: !InfrastructureShared
-- Name: !#BM_NUPKG_FILE
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & BM_ZIP_FILE

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= nil and StringEndsWith(l_0_0, "nupkg") then
  return mp.INFECTED
end
return mp.CLEAN
