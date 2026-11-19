-- Threat: !InfrastructureShared
-- Name: 2978baea45db
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
