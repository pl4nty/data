-- Threat: !InfrastructureShared
-- Name: a17861527f7b
-- Type: 21

if mp.get_mpattribute("pea_isdll") and mp.getfilesize() < 6656 then
  return mp.INFECTED
end
return mp.CLEAN
