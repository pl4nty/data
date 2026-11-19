-- Threat: !InfrastructureShared
-- Name: !#ALFPER:Trojan:Win32/WlbsctrlHijack.A!dha
-- Type: 13
-- MpAttributes: Lua:TopLevelUnsigned & Lua:DLLExt & (HSTR:ProcessInjectionAPIs | #LowFiCreateRemoteThread | SLF:MeterRefLoadApiHash | ALFPER:RefLoadApiHash)

local l_0_0 = mp.getfilesize()
if l_0_0 < 300000 then
  local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_1:find("\\system32\\wlbsctrl", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
