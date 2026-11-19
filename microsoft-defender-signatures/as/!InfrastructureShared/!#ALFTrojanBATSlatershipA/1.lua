-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:BAT/Slatership.A
-- Type: 13
-- MpAttributes: SCPT:Slatership.A & SCPT:Slatership.B & SCPT:Slatership.C

local l_0_0 = "wintool.exe"
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_2 == nil then
  return mp.INFECTED
end
local l_0_3 = MpCommon.PathToWin32Path(l_0_1 .. "\\" .. l_0_2)
if l_0_3 == nil then
  return mp.INFECTED
end
if string.find(l_0_2, ".exe->(rarsfx)->", 1, true) then
  local l_0_4 = string.sub(l_0_2, 1, string.find(l_0_2, "->", 1, true) - 1)
  if l_0_4 ~= l_0_0 then
    mp.changedetectionname(3902275675)
  end
end
return mp.INFECTED
