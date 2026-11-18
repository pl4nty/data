-- Threat: !InfrastructureShared
-- Name: !#ALF:Backdoor:Java/DellManagementWebshell.A
-- Type: 24
-- MpAttributes: RPF:TopLevelFile & Lua:JSPExt & (Lua:FileSizeLT4000 | Lua:FileSizeLT2000 | Lua:FileSizeLT800)

local l_0_0 = mp.enum_mpattributesubstring("SCPT:jspWebShell")
if 0 < #l_0_0 then
  local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_1:find("\\dell\\wms\\tomcat-9\\webapps\\root\\", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
