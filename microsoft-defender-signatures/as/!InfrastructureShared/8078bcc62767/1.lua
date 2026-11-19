-- Threat: !InfrastructureShared
-- Name: 8078bcc62767
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
