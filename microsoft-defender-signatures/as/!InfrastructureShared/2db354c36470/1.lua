-- Threat: !InfrastructureShared
-- Name: 2db354c36470
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(string.lower(this_sigattrlog[2].utf8p1))
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0, "(.-)[^\\]-[^\\%.]+$")
local l_0_2 = {
  "C:\\windows\\system32\\"
}
for l_0_3, l_0_4 in pairs(l_0_2) do
  if #l_0_1 > #l_0_4 and string.find(l_0_1, l_0_4, 1, true) then
    return mp.CLEAN
  end
end
bm.add_related_string("DLLSearchHijacking", tostring(l_0_0), bm.RelatedStringBMReport)
return mp.INFECTED
