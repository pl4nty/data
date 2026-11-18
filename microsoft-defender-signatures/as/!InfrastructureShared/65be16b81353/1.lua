-- Threat: !InfrastructureShared
-- Name: 65be16b81353
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:MimobSMS.A")
  return mp.INFECTED
end
return mp.LOWFI
