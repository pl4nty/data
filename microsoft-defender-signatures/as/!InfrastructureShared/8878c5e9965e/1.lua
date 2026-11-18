-- Threat: !InfrastructureShared
-- Name: 8878c5e9965e
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_LOWERCASE, mp.FILEPATH_QUERY_FULL))
if not StringEndsWith(l_0_0, ".exe") then
  return mp.CLEAN
end
if StringEndsWith(l_0_0, "xii_uninit.exe") and (string.find(l_0_0, ":\\program files", 1, true) or string.find(l_0_0, "\\vgn vhub", 1, true)) then
  return mp.CLEAN
end
MpCommon.SetOriginalFileName(l_0_0, "BM_XIIUNINIT_EXE")
return mp.INFECTED
