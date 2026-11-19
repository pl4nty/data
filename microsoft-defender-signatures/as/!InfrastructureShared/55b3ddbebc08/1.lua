-- Threat: !InfrastructureShared
-- Name: 55b3ddbebc08
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
local l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[2].utf8p1
end
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.ContextualExpandEnvironmentVariables("%temp%")
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
l_0_1 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_1))
if string.find(string.lower(l_0_1), l_0_2) == nil then
  return mp.CLEAN
end
if l_0_0 ~= nil then
  local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
    if sysio.IsFileExists(l_0_5) and (l_0_5:len() < 9 or string.lower(string.sub(l_0_5, -9)) ~= "mshta.exe") and sysio.IsFileExists(l_0_5) then
      bm.add_related_file(l_0_5)
    end
  end
end
return mp.INFECTED
