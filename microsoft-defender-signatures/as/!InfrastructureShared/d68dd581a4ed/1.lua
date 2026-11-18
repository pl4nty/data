-- Threat: !InfrastructureShared
-- Name: d68dd581a4ed
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:SniperSpy.A")
  return mp.INFECTED
end
return mp.LOWFI
