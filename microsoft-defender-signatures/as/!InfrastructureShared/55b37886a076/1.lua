-- Threat: !InfrastructureShared
-- Name: 55b37886a076
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  if string.find(l_0_0, "hidden", 1, true) and string.find(l_0_0, "iex", 1, true) and string.find(l_0_0, "text.encoding", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
