-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/WebShell.A
-- Type: 13
-- MpAttributes: !BM_MZ_FILE & RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if l_0_0 == "w3wp.exe" then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  local l_0_2 = mp.GetProcessCommandLine(l_0_1)
  if l_0_2 == nil then
    return mp.CLEAN
  end
  l_0_2 = string.lower(l_0_2)
  if l_0_2 == nil or string.len(l_0_2) == 0 then
    return mp.CLEAN
  end
  if string.find(l_0_2, "msexchangeowaapppool", 1, true) == nil and string.find(l_0_2, "msexchangeecpapppool", 1, true) == nil then
    return mp.CLEAN
  end
elseif l_0_0 ~= "umworkerprocess.exe" then
  return mp.CLEAN
end
local l_0_3 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if string.find(l_0_3, "\\inetpub\\wwwroot\\", 1, true) == nil then
  return mp.CLEAN
end
local l_0_4 = mp.enum_mpattributesubstring("SCPT:pyWebShell")
if 5 <= #l_0_4 then
  return mp.INFECTED
end
local l_0_5 = mp.enum_mpattributesubstring("SCPT:CsharpWebShell")
if 5 <= #l_0_5 then
  return mp.INFECTED
end
local l_0_6 = mp.enum_mpattributesubstring("SCPT:jsWebShell")
if 3 <= #l_0_6 then
  return mp.INFECTED
end
local l_0_7 = mp.enum_mpattributesubstring("SCPT:jspWebShell")
if 5 <= #l_0_7 then
  return mp.INFECTED
end
local l_0_8 = mp.enum_mpattributesubstring("SCPT:phpWebShell")
if 5 <= #l_0_8 then
  return mp.INFECTED
end
if 5 <= #l_0_4 + #l_0_5 + #l_0_6 + #l_0_7 + #l_0_8 then
  return mp.INFECTED
end
return mp.CLEAN
