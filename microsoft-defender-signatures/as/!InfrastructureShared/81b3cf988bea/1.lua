-- Threat: !InfrastructureShared
-- Name: 81b3cf988bea
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  local l_0_1 = "System.IO.MemoryStream"
  if string.find(l_0_0, l_0_1) then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
