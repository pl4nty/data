-- Threat: !InfrastructureShared
-- Name: 3fb38ba5163f
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 == nil or #l_0_0 <= 15 then
  return mp.CLEAN
end
local l_0_1 = {
  "/si",
  "/m",
  "password",
  "*.*"
}
for l_0_2, l_0_3 in pairs(l_0_1) do
  if string.find(l_0_0, l_0_3, 1, true) == nil then
    return mp.CLEAN
  end
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_4 = string.lower(this_sigattrlog[1].utf8p2)
  if 1 < #l_0_4 then
    local l_0_5 = mp.GetExecutablesFromCommandLine(l_0_4)
    for l_0_6, l_0_7 in ipairs(l_0_5) do
      l_0_7 = mp.ContextualExpandEnvironmentVariables(l_0_7)
      if sysio.IsFileExists(l_0_7) then
        bm.add_related_file(l_0_7)
      end
    end
  end
end
return mp.INFECTED
