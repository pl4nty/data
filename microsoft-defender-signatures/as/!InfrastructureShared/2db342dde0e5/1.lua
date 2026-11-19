-- Threat: !InfrastructureShared
-- Name: 2db342dde0e5
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].wp2 ~= nil then
  l_0_0 = this_sigattrlog[2]
else
  return mp.CLEAN
end
local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0.utf8p2)
local l_0_2 = false
for l_0_3, l_0_4 in ipairs(l_0_1) do
  l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
  if sysio.IsFileExists(l_0_4) and not mp.IsKnownFriendlyFile(l_0_4, true, false) then
    l_0_2 = true
    bm.add_related_file(l_0_4)
  end
end
if l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
