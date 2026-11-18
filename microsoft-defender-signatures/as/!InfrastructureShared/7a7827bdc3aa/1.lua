-- Threat: !InfrastructureShared
-- Name: 7a7827bdc3aa
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 900000 then
  return mp.INFECTED
end
return mp.CLEAN
