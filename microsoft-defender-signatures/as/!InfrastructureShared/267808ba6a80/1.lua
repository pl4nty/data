-- Threat: !InfrastructureShared
-- Name: 267808ba6a80
-- Type: 21

if mp.get_mpattribute("pea_isexe") then
  return mp.INFECTED
end
return mp.CLEAN
