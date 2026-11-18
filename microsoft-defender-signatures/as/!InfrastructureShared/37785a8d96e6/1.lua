-- Threat: !InfrastructureShared
-- Name: 37785a8d96e6
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() >= 100000 then
  return mp.INFECTED
end
return mp.CLEAN
