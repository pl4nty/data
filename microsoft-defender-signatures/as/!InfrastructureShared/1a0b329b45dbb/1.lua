-- Threat: !InfrastructureShared
-- Name: 1a0b329b45dbb
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p2)
else
  return mp.CLEAN
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1
l_0_1 = string.match(string.lower(l_0_0), "[%s]+\"?(%a:[^\"]+)\"?$")
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_1) then
  bm.add_related_file(l_0_1)
end
l_0_1 = nil
if this_sigattrlog[4].matched then
  l_0_1 = this_sigattrlog[4].utf8p1
  if l_0_1 ~= nil and l_0_1 ~= "" and sysio.IsFileExists(l_0_1) then
    bm.add_related_file(l_0_1)
  end
end
l_0_1 = nil
if this_sigattrlog[5].matched then
  l_0_1 = this_sigattrlog[5].utf8p1
  if l_0_1 ~= nil and l_0_1 ~= "" and sysio.IsFileExists(l_0_1) then
    bm.add_related_file(l_0_1)
  end
end
return mp.INFECTED
