-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Win32/SockScoutScript.gen!dha
-- Type: 13
-- MpAttributes: BM_TEXT_FILE & (LUA:FileSizeLE100.A | LUA:FileSizeLE200.A | LUA:FileSizeLE400.A | LUA:FileSizeLE800.A | LUA:FileSizeLE1000.A) & (SCPT:SockScoutScript.A | SCPT:SockScoutScript.B | SCPT:SockScoutScript.C | SCPT:SockScoutScript.D | SCPT:SockScoutScript.E)

local l_0_0 = mp.getfilesize()
if l_0_0 < 100 then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("SCPT:SockScoutScript")
if #l_0_1 < 3 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = pcall(mp.getfilename, mp.FILEPATH_QUERY_PATH)
if l_0_2 then
  if not l_0_3:find("\\Scripts", 1, true) then
    return mp.CLEAN
  else
    mp.set_mpattribute("MpNonPIIFileType")
    return mp.INFECTED
  end
end
return mp.CLEAN
