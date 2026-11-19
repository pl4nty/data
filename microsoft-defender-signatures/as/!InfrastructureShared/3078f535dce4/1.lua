-- Threat: !InfrastructureShared
-- Name: 3078f535dce4
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
