-- Threat: !InfrastructureShared
-- Name: 3d78080236af
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
