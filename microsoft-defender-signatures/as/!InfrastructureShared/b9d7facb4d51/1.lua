-- Threat: !InfrastructureShared
-- Name: b9d7facb4d51
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0))
local l_0_2 = {
  "(?:set|add)-mppreference\\s+-exclusionextension\\s+\\*\\.?(?:exe|dll)\\s",
  "(?:set|add)-mppreference\\s+-exclusionextension\\s*['\"]?dll['\"]?",
  "(?:set|add)-mppreference\\s+-exclusionprocess\\s+\\.?(?:exe|dll|regsvr32|rundll32|powershell|iexplore|explorer|msiexec)(?:.exe|\\s*|\\*)?",
  "(?:set|add)-mppreference\\s+-exclusionextension\\s+@\\(['\"]?exe['\"]?,['\"]?dll['\"]?\\)\\s+"
}
local l_0_3 = false
for l_0_4, l_0_5 in ipairs(l_0_2) do
  l_0_3, l_0_4 = MpCommon.StringRegExpSearch(l_0_5, l_0_1)
  if l_0_3 then
    return mp.INFECTED
  end
end
return mp.CLEAN
