-- Threat: !InfrastructureShared
-- Name: 337845e5f270
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() >= 240000 and mp.getfilesize() <= 254000 then
  return mp.INFECTED
end
return mp.CLEAN
