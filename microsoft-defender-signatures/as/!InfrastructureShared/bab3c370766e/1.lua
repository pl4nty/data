-- Threat: !InfrastructureShared
-- Name: bab3c370766e
-- Type: 21

local l_0_0, l_0_1
if not this_sigattrlog[1].matched and not this_sigattrlog[2].matched then
  return mp.CLEAN
elseif this_sigattrlog[3].matched and this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
  l_0_1 = string.lower(this_sigattrlog[3].utf8p1)
end
if l_0_0 ~= nil and l_0_1 ~= nil then
  local l_0_2 = l_0_0:match("%.([a-z0-9][a-z0-9][a-z0-9][a-z0-9][a-z0-9][a-z0-9])$")
  local l_0_3 = l_0_1:match("\\([a-z0-9][a-z0-9][a-z0-9][a-z0-9][a-z0-9][a-z0-9])[a-z0-9][a-z0-9]$")
  if l_0_2 == l_0_3 and l_0_2 ~= nil and l_0_3 ~= nil and mp.get_sigattr_event_count(16385) > 10 and 10 < mp.get_sigattr_event_count(16386) then
    return mp.INFECTED
  end
end
return mp.CLEAN
