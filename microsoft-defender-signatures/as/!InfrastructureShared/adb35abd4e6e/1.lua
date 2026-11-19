-- Threat: !InfrastructureShared
-- Name: adb35abd4e6e
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
else
  return mp.CLEAN
end
if l_0_0 == nil or string.len(l_0_0) == 0 then
  return mp.CLEAN
end
local l_0_1 = false
for l_0_2 in l_0_0:gmatch("([^\r\n]*)\n?") do
  l_0_2 = mp.ContextualExpandEnvironmentVariables(l_0_2)
  if sysio.IsFileExists(l_0_2) and mp.IsKnownFriendlyFile(l_0_2, true, false) == false then
    bm.add_threat_file(l_0_2)
    l_0_1 = true
  end
end
if l_0_1 == true then
  return mp.INFECTED
end
return mp.CLEAN
