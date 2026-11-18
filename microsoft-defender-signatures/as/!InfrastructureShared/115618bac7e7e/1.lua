-- Threat: !InfrastructureShared
-- Name: 115618bac7e7e
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_LOWERCASE, mp.FILEPATH_QUERY_FULL))
if StringEndsWith(l_0_0, "renpy.exe") and string.match(l_0_0, "\\renpy%-%d+%.%d+%.?%d*%.?%d*%-sdk\\renpy%.exe$") then
  return mp.CLEAN
end
MpCommon.SetOriginalFileName(l_0_0, "BM_RENPY_EXE")
return mp.INFECTED
