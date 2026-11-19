-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Win64/OneLook.Out!dha
-- Type: 13
-- MpAttributes: BM_TEXT_FILE & Lua:TXTExt & SCPT:OneLook.A & SCPT:OneLook.B & SCPT:OneLook.C & SCPT:OneLook.D & SCPT:OneLook.E & (LUA:FileSizeLE100.A | LUA:FileSizeLE200.A | LUA:FileSizeLE400.A | LUA:FileSizeLE800.A | LUA:FileSizeLE1000.A)

local l_0_0, l_0_1 = pcall(mp.getfilename, mp.FILEPATH_QUERY_FNAME)
if l_0_0 then
  local l_0_2 = l_0_1:sub(1, 4)
  if l_0_2 ~= "res_" then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
