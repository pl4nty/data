-- Threat: !InfrastructureShared
-- Name: eb61764941ea
-- Type: 21

if peattributes.isexe and peattributes.no_security and mp.getfilesize() >= 458752 and mp.getfilesize() <= 483328 then
  return mp.INFECTED
end
return mp.LOWFI
