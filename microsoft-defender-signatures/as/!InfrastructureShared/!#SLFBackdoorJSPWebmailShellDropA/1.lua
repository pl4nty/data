-- Threat: !InfrastructureShared
-- Name: !#SLF:Backdoor:JSP/WebmailShellDrop.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:JSPExt & (scpt:ShellCode:upload | scpt:ShellCode:input | scpt:ShellCode:write | scpt:ShellCode:req1)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if string.find(l_0_1, "/opt/zimbra/jetty/webapps/", 1, true) or string.find(l_0_1, "/opt/zimbra/jetty_base/webapps/", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
