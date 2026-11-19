-- Threat: !InfrastructureShared
-- Name: 5e782119dca0
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
