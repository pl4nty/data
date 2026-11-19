-- Threat: !InfrastructureShared
-- Name: 89d7ec9764f9
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0))
local l_0_2 = {
  "(?:set|add)-mppreference\\s+-exclusionpath\\s+\\w:\\\\\\s*$",
  "(?:set|add)-mppreference\\s+-exclusionpath\\s+\\w:\\\\\\s*[,;]\\s*\\w+?"
}
local l_0_3 = false
for l_0_4, l_0_5 in ipairs(l_0_2) do
  l_0_3, l_0_4 = MpCommon.StringRegExpSearch(l_0_5, l_0_1)
  if l_0_3 then
    return mp.LOWFI
  end
end
return mp.CLEAN
