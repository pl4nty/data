-- Threat: \xac!Colorexe.A
-- Type: 12
-- MpAttributes: MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 or l_0_0 == "" then
  return mp.CLEAN
end
if string.find(l_0_0, "\\spool\\drivers\\color\\", 1, true) ~= nil and (l_0_0:sub(-4) == ".exe" or l_0_0:sub(-4) == ".dll") then
  return mp.INFECTED
end
return mp.CLEAN
