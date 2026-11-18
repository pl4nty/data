-- Threat: !InfrastructureShared
-- Name: !#ALF:Lua:NewlyWrittenPSExecViaSmb
-- Type: 13
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: BM_RemoteInvocation:FileRemoteDropContext

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 then
  return mp.CLEAN
end
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = MpCommon.Base64Encode(l_0_0)
local l_0_3 = GetRollingQueueKeyValue("rq_fileremotedrop", l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_4 = MpCommon.GetOriginalFileName(l_0_0)
local l_0_5 = false
if l_0_4 == "psexesvc.exe" or l_0_4 == "psexec.c" then
  l_0_5 = true
  AppendToRollingQueue("renamed_psexec", l_0_3, l_0_2, 600, 1)
end
if not l_0_5 then
  local l_0_6 = GetRollingQueueKeyValue("renamed_psexec", l_0_3)
  if l_0_6 == l_0_2 then
    return mp.CLEAN
  end
  local l_0_7 = {
    "\\windows\\temp\\ot-",
    "systeminsights.capabilities.anomalydetection"
  }
  if contains(l_0_0, l_0_7) then
    return mp.CLEAN
  end
  local l_0_8 = {
    ["c:\\programdata"] = true,
    ["c:\\perflogs"] = true,
    ["c:\\windows\\help"] = true,
    ["c:\\windows\\debug"] = true,
    ["c:\\windows\\tapi"] = true,
    ["c:\\windows\\temp"] = true,
    ["c:\\intel"] = true,
    ["c:\\users\\public"] = true
  }
  if l_0_8[l_0_0] then
    return mp.INFECTED
  end
end
return mp.CLEAN
