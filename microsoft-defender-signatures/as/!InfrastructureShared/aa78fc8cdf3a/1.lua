-- Threat: !InfrastructureShared
-- Name: aa78fc8cdf3a
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
