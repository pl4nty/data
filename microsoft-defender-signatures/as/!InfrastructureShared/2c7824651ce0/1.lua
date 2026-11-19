-- Threat: !InfrastructureShared
-- Name: 2c7824651ce0
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 95000 then
  return mp.INFECTED
end
return mp.CLEAN
