-- Threat: !InfrastructureShared
-- Name: !#TELPER:LUA:Trojan:Win32/MsWinHostsPatchedFile.A
-- Type: 13
-- MpAttributes: BM_ScriptMsWinHostsFile

local l_0_0 = mp.getfilesize()
if 4096 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.getfilename())
local l_0_2, l_0_3, l_0_4 = string.find(l_0_1, "\\system32(\\%l+\\%l+\\%l+%.dat)$")
if not l_0_2 then
  return mp.CLEAN
end
if string.len(l_0_4) ~= 18 then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_5 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  local l_0_6 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH))
  if l_0_5 ~= nil and l_0_6 ~= nil then
    mp.ReportLowfi(MpCommon.PathToWin32Path(l_0_6) .. "\\" .. l_0_5, 279611152)
  end
end
return mp.INFECTED
