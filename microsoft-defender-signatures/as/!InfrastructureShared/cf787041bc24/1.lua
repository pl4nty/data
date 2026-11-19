-- Threat: !InfrastructureShared
-- Name: cf787041bc24
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() >= 100000 and mp.getfilesize() <= 300000 then
  return mp.INFECTED
end
return mp.CLEAN
