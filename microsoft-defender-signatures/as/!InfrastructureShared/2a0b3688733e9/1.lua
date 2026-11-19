-- Threat: !InfrastructureShared
-- Name: 2a0b3688733e9
-- Type: 21

if (this_sigattrlog[5].matched or this_sigattrlog[6]) and this_sigattrlog[11].matched then
  local l_0_0 = this_sigattrlog[11].utf8p2
  if l_0_0 and string.find(l_0_0, "/upn", 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
