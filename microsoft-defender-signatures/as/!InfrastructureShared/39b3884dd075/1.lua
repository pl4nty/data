-- Threat: !InfrastructureShared
-- Name: 39b3884dd075
-- Type: 21
-- Includes: TechniqueTracker

if IsLegacyOrgMachine() then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
if string.len(l_0_0) < 700 then
  return mp.CLEAN
end
if IsProcNameInParentProcessTree("BM", "winword.exe") then
  return mp.INFECTED
end
return mp.CLEAN
