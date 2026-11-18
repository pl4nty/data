-- Threat: !InfrastructureShared
-- Name: 2d78f1232506
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
