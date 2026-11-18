-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Win32/SockScoutSide.gen!dha
-- Type: 13
-- MpAttributes: Lua:FileSizeLT2000 & Lua:TXTExt

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= "config.txt" then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if 1024 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.enum_mpattributesubstring("SCPT:SockScoutSide")
if 3 <= #l_0_2 then
  mp.set_mpattribute("MpNonPIIFileType")
  return mp.INFECTED
end
return mp.CLEAN
