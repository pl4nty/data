-- Threat: !InfrastructureShared
-- Name: 5fb3467db8fa
-- Type: 21

local l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(bm.get_imagepath()))
if string.find(l_0_0, "\\system32\\svchost.exe", 1, true) or string.find(l_0_0, "\\system32\\taskeng.exe", 1, true) then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[1].utf8p2
end
if l_0_1 == nil and this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[2].utf8p2
end
local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
if l_0_2 ~= nil then
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
    bm.add_related_file(l_0_4)
  end
end
return mp.INFECTED
