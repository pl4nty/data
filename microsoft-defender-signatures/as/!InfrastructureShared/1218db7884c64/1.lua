-- Threat: !InfrastructureShared
-- Name: 1218db7884c64
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:MSpy.G")
  return mp.INFECTED
end
return mp.LOWFI
