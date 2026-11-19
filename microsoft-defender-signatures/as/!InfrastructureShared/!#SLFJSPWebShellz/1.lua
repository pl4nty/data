-- Threat: !InfrastructureShared
-- Name: !#SLF:JSPWebShellz
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:JSPExt & SCPT:Backdoor:Java/WebShellz.WA & SCPT:Backdoor:Java/WebShellz.WD

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if #l_0_1 == 20 and string.match(l_0_1, "^%x+%.jsp$") and (string.find(l_0_0, "/windchill/login/", 1, true) or string.find(l_0_0, "/windchill/codebase/login/", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
