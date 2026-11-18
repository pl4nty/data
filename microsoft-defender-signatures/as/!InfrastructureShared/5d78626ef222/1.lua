-- Threat: !InfrastructureShared
-- Name: 5d78626ef222
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 433245 then
  return mp.INFECTED
end
return mp.CLEAN
