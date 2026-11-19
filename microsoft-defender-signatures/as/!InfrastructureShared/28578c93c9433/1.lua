-- Threat: !InfrastructureShared
-- Name: 28578c93c9433
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and mp.getfilesize() < 33172 then
  return mp.INFECTED
end
return mp.CLEAN
