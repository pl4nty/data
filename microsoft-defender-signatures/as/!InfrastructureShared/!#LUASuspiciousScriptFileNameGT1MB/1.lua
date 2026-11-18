-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousScriptFileNameGT1MB
-- Type: 13
-- MpAttributes: (BM_TEXT_FILE | BM_UNKNOWN_FILE | Lua:SingleFileInZip | Html_file)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if mp.getfilesize() < 1048576 or mp.getfilesize() > 7340032 then
  return mp.CLEAN
end
if string.find(l_0_0, "img-202508-wa0008.js", 1, true) ~= nil or string.find(l_0_0, "wmieventlogs.js", 1, true) ~= nil or string.find(l_0_0, "discord virus.js", 1, true) ~= nil or string.find(l_0_0, "copilotdrivers.js", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
