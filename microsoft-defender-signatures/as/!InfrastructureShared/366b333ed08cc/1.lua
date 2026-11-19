-- Threat: !InfrastructureShared
-- Name: 366b333ed08cc
-- Type: 21

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[9].matched then
  l_0_0 = this_sigattrlog[9].utf8p1
elseif this_sigattrlog[10].matched then
  l_0_0 = this_sigattrlog[10].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if this_sigattrlog[11].matched then
  l_0_2 = string.lower(this_sigattrlog[11].utf8p2)
elseif this_sigattrlog[12].matched then
  l_0_2 = string.lower(this_sigattrlog[12].utf8p2)
end
if l_0_0 ~= nil and l_0_2 ~= nil then
  l_0_1 = string.match(l_0_0, "\\([^\\]+)$")
  l_0_2 = string.match(l_0_2, "\\([^\\]+)$")
  if l_0_1 == l_0_2 then
    mp.ReportLowfi(mp.ContextualExpandEnvironmentVariables(l_0_0), 2084403703)
    return mp.INFECTED
  end
end
return mp.CLEAN
