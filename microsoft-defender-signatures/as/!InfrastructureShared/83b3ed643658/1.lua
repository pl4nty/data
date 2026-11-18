-- Threat: !InfrastructureShared
-- Name: 83b3ed643658
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[2].utf8p2
  if 300 <= #l_0_0 then
    return mp.INFECTED
  end
end
return mp.CLEAN
