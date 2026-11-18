-- Threat: !InfrastructureShared
-- Name: 69b3f0433ce1
-- Type: 21

if bm.GetSignatureMatchDuration() > 200000000 then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 == nil then
  return mp.INFECTED
end
local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
for l_0_2, l_0_3 in ipairs(l_0_1) do
  l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
  if sysio.IsFileExists(l_0_3) then
    bm.add_related_file(l_0_3)
  end
end
return mp.INFECTED
