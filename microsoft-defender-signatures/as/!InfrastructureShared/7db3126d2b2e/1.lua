-- Threat: !InfrastructureShared
-- Name: 7db3126d2b2e
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
end
if this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p2
end
local l_0_1 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_0))
if l_0_0 == nil or string.find(l_0_0, "searchsettings\\nthook64.dll", 1, true) or string.find(l_0_0, "searchsettings\\nthook.dll", 1, true) or string.find(l_0_0, "cognitas\\csathl64.dll", 1, true) or string.find(l_0_0, "cognitas\\csathl.dll", 1, true) or string.find(l_0_0, "sun\\java\\deployment\\cache", 1, true) or string.find(l_0_0, "surfcanyon\\iesearchplugin64.dll", 1, true) or mp.IsKnownFriendlyFile(l_0_1, true, false) then
  return mp.CLEAN
end
return mp.INFECTED
