-- Threat: !InfrastructureShared
-- Name: 166789a6c7b64
-- Type: 21

if mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
