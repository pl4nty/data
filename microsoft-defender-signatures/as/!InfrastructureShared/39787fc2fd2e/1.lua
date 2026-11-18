-- Threat: !InfrastructureShared
-- Name: 39787fc2fd2e
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
