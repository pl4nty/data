-- Threat: !InfrastructureShared
-- Name: 2bfb3f11c8aa7
-- Type: 21

if this_sigattrlog[3].matched and this_sigattrlog[4].matched then
  if this_sigattrlog[3].utf8p1 == nil or this_sigattrlog[3].utf8p1 == "" or this_sigattrlog[4].utf8p1 == nil or this_sigattrlog[4].utf8p1 == "" then
    return mp.CLEAN
  end
  local l_0_0 = string.match(string.lower(this_sigattrlog[3].utf8p1), "[^/]+$")
  local l_0_1 = string.match(string.lower(this_sigattrlog[4].utf8p1), "[^/]+$")
  if l_0_0 == l_0_1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
