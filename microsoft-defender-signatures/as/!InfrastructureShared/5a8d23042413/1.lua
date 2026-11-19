-- Threat: !InfrastructureShared
-- Name: 5a8d23042413
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Tunenup.B")
  return mp.INFECTED
end
return mp.LOWFI
