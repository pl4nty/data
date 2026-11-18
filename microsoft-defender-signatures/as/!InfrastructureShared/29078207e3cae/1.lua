-- Threat: !InfrastructureShared
-- Name: 29078207e3cae
-- Type: 21

if mp.HSTR_WEIGHT > 8 and mp.HSTR_WEIGHT < 18 then
  mp.set_mpattribute("HSTR:Genasom.P")
end
return mp.INFECTED
