-- Threat: !InfrastructureShared
-- Name: bdd7faf1f07a
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if type(l_0_0) ~= "string" or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if type(l_0_1) ~= "string" or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = {
  {
    pattern = "(?i)\\bartex[-_]i[a-z0-9_-]*",
    attribute = "Artex_Attribute_ST01"
  },
  {
    pattern = "(?i)\\b(?:artx|artex)[-_][a-z0-9_-]*",
    attribute = "Artex_Attribute_ST02"
  },
  {
    pattern = "(?i)\\bartx[-_][a-z0-9_-]*",
    attribute = "Artex_Attribute_ST03"
  },
  {
    pattern = "(?i)(?:^|[^a-z0-9_])(?:artx|artex)[0-9]+[-_][a-z0-9_-]*",
    attribute = "Artex_Attribute_ST04"
  }
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if MpCommon.StringRegExpSearch(l_0_4.pattern, l_0_1) then
    mp.set_mpattribute(l_0_4.attribute)
    return mp.CLEAN
  end
end
return mp.CLEAN
