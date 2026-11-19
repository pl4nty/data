-- Threat: !InfrastructureShared
-- Name: 3a78c460658b
-- Type: 21

if mp.get_mpattribute("pea_isexe") and mp.getfilesize() < 1024000 then
  return mp.INFECTED
end
return mp.CLEAN
