-- Threat: !InfrastructureShared
-- Name: 5d783e78700a
-- Type: 21

if peattributes.isexe and mp.getfilesize() < 220000 then
  return mp.INFECTED
end
return mp.CLEAN
