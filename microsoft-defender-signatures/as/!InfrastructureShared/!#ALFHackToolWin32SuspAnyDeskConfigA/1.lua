-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Win32/SuspAnyDeskConfig.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:CONFExt

if mp.get_mpattribute("SCPT:SuspAnyDeskConfig.A") then
  local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_0 ~= nil and l_0_0:find("system.conf", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
