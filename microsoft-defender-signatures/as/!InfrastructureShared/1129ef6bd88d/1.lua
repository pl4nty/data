-- Threat: !InfrastructureShared
-- Name: 1129ef6bd88d
-- Type: 21

local l_0_0 = mp.GetBruteMatchData()
if l_0_0.match_offset == 0 then
  return mp.INFECTED
end
return mp.CLEAN
