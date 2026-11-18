-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:LNK/ArcticShelf.A
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: RPF:TopLevelFile & BM_LNK_FILE

local l_0_0 = mp.GetLnkInfo()
if not l_0_0 or type(l_0_0.Arguments) ~= "string" or l_0_0.Arguments == "" then
  return mp.CLEAN
end
local l_0_1 = {
  "pythonw.exe ",
  " schtasks /",
  " curl ",
  "appdata",
  "&dl=0",
  ".pdf?",
  ".dropbox."
}
if not containsall(l_0_0.Arguments, l_0_1) then
  return mp.CLEAN
end
return mp.INFECTED
