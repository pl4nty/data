-- Threat: !InfrastructureShared
-- Name: 4978a5f1aec5
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 2000000 and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
