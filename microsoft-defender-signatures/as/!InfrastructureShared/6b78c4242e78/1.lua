-- Threat: !InfrastructureShared
-- Name: 6b78c4242e78
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 37000000 then
  return mp.INFECTED
end
return mp.CLEAN
