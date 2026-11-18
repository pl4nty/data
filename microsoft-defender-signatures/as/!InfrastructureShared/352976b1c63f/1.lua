-- Threat: !InfrastructureShared
-- Name: 352976b1c63f
-- Type: 21

local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = l_0_0.match_offset + 1
local l_0_2 = l_0_0.match_offset + 1 + 1024
local l_0_3 = tostring(l_0_0.is_header and headerpage or footerpage):sub(l_0_1, l_0_2):lower()
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = mp.GetExecutablesFromCommandLine(l_0_3)
for l_0_5, l_0_6 in ipairs(l_0_4) do
  if l_0_6:find("insert.ps1", 1, true) or l_0_6:find("get-bitlockerkeys.ps1", 1, true) then
    return mp.CLEAN
  end
  if sysio.IsFileExists(l_0_6) and not mp.IsKnownFriendlyFile(l_0_6, false, false) then
    mp.ReportLowfi(l_0_6, 443472619)
  end
end
return mp.INFECTED
