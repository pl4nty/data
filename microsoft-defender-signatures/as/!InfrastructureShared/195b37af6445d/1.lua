-- Threat: !InfrastructureShared
-- Name: 195b37af6445d
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p1)
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p1)
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[7].utf8p1)
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[8].utf8p1)
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[9].utf8p1)
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[10].utf8p1)
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[11].utf8p1)
elseif this_sigattrlog[12].matched and this_sigattrlog[12].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[12].utf8p1)
elseif this_sigattrlog[13].matched and this_sigattrlog[13].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[13].utf8p1)
elseif this_sigattrlog[14].matched and this_sigattrlog[14].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[14].utf8p1)
elseif this_sigattrlog[15].matched and this_sigattrlog[15].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[15].utf8p1)
elseif this_sigattrlog[16].matched and this_sigattrlog[16].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[16].utf8p1)
elseif this_sigattrlog[17].matched and this_sigattrlog[17].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[17].utf8p1)
elseif this_sigattrlog[18].matched and this_sigattrlog[18].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[18].utf8p1)
elseif this_sigattrlog[19].matched and this_sigattrlog[19].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[19].utf8p1)
elseif this_sigattrlog[20].matched and this_sigattrlog[20].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[20].utf8p1)
end
if l_0_0 ~= nil then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(l_0_0)
  if l_0_0 == nil then
    return mp.CLEAN
  end
  l_0_0 = string.lower(l_0_0)
  local l_0_1 = l_0_0:match("\\([^\\]+)$")
  local l_0_2 = string.sub(l_0_0, 1, string.len(l_0_0) - string.len(l_0_1) - 1)
  if l_0_1 == nil or l_0_2 == nil then
    return mp.CLEAN
  end
  if l_0_2:find(":\\windows\\system32", 1, true) or l_0_2:find(":\\windows\\syswow64", 1, true) then
    return mp.CLEAN
  end
  if l_0_2:find(":\\windows\\servicing", 1, true) or l_0_2:find(":\\windows\\winsxs", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
