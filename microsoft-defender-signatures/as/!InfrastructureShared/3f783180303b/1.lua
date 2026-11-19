-- Threat: !InfrastructureShared
-- Name: 3f783180303b
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
