-- Threat: !InfrastructureShared
-- Name: 201b383338303
-- Type: 21

local l_0_0
if this_sigattrlog[14].matched then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[14].utf8p2))
  if string.match(l_0_0, "/addfile [^ ]+ \\\\localhost\\[^ ]* [^ ]+") ~= nil then
    return mp.INFECTED
  elseif string.match(l_0_0, "/addfile [^ ]+ \\\\127%.0%.0%.1\\[^ ]* [^ ]+") ~= nil then
    return mp.INFECTED
  elseif string.match(l_0_0, "/addfile [^ ]+ .:\\[^ ]* [^ ]+") ~= nil then
    return mp.INFECTED
  else
    return mp.CLEAN
  end
elseif this_sigattrlog[15].matched then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[15].utf8p2))
  if string.match(l_0_0, "/replaceremoteprefix [^ ]+ [^ ]+ \\\\localhost\\[^ ]*") ~= nil then
    return mp.INFECTED
  elseif string.match(l_0_0, "/replaceremoteprefix [^ ]+ [^ ]+ \\\\127%.0%.0%.1\\[^ ]*") ~= nil then
    return mp.INFECTED
  elseif string.match(l_0_0, "/replaceremoteprefix [^ ]+ [^ ]+ .:\\[^ ]*") ~= nil then
    return mp.INFECTED
  else
    return mp.CLEAN
  end
elseif this_sigattrlog[16].matched then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[16].utf8p2))
  if string.match(l_0_0, "http[s]?%:%/%/") ~= nil then
    return mp.INFECTED
  else
    return mp.CLEAN
  end
end
return mp.CLEAN
