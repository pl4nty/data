-- Threat: !InfrastructureShared
-- Name: 5578538a7f48
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() >= 4000000 and mp.getfilesize() <= 8000000 then
  return mp.INFECTED
end
return mp.CLEAN
