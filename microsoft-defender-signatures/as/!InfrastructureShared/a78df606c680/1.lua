-- Threat: !InfrastructureShared
-- Name: a78df606c680
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Bundlore.X")
  return mp.INFECTED
end
return mp.LOWFI
