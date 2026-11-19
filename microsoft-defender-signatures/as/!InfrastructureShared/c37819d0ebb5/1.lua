-- Threat: !InfrastructureShared
-- Name: c37819d0ebb5
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() >= 56000 and mp.getfilesize() <= 58000 then
  return mp.INFECTED
end
return mp.CLEAN
