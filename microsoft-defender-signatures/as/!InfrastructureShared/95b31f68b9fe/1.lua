-- Threat: !InfrastructureShared
-- Name: 95b31f68b9fe
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p2))
elseif this_sigattrlog[2].matched then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p2))
else
  return mp.CLEAN
end
if string.match(l_0_0, "/replaceremoteprefix [^ ]+ [^ ]+ \\\\localhost\\[^ ]*") ~= nil then
  return mp.INFECTED
elseif string.match(l_0_0, "/replaceremoteprefix [^ ]+ [^ ]+ \\\\127%.0%.0%.1\\[^ ]*") ~= nil then
  return mp.INFECTED
elseif string.match(l_0_0, "/replaceremoteprefix [^ ]+ [^ ]+ .:\\[^ ]*") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
