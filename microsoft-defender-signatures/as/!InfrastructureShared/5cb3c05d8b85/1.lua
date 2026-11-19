-- Threat: !InfrastructureShared
-- Name: 5cb3c05d8b85
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  if string.find(l_0_0, "\\programdata\\", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
