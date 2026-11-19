-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:PHP/Sirensheet.A!dha
-- Type: 24
-- MpAttributes: TEL:Exploit:JS/WebRTCLeak & Lua:PHPExt

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == "getpasswordpage.php" then
  return mp.INFECTED
end
return mp.CLEAN
