-- Threat: !InfrastructureShared
-- Name: 8bbeacd0aa79
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:FakeApp.N")
  return mp.INFECTED
end
return mp.LOWFI
