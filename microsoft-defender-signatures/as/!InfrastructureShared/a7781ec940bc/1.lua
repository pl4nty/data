-- Threat: !InfrastructureShared
-- Name: a7781ec940bc
-- Type: 21

if peattributes.isexe and mp.getfilesize() > 686080 then
  return mp.INFECTED
end
return mp.CLEAN
