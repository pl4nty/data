-- Threat: !InfrastructureShared
-- Name: 26789243a54b
-- Type: 21

if mp.get_mpattribute("pea_hasexports") then
  return mp.INFECTED
end
return mp.CLEAN
