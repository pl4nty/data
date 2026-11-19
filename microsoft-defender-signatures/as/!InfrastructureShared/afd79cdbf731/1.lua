-- Threat: !InfrastructureShared
-- Name: afd79cdbf731
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0))
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = {
  "add%-mppreference%s+%-exclusionpath%s+['\"]?c:\\windows\\system32\\?['\"]?%s*$",
  "set%-mppreference%s+%-exclusionpath%s+['\"]?c:\\windows\\system32\\?['\"]?%s*$"
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  local l_0_5, l_0_6 = MpCommon.StringRegExpSearch(l_0_4, l_0_1)
  if l_0_5 then
    return mp.LOWFI
  end
end
return mp.CLEAN
