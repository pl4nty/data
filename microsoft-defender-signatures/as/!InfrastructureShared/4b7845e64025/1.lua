-- Threat: !InfrastructureShared
-- Name: 4b7845e64025
-- Type: 21

if peattributes.isexe and mp.getfilesize() > 9000000 then
  return mp.INFECTED
end
return mp.CLEAN
