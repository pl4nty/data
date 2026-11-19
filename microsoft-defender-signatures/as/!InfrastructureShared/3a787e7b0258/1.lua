-- Threat: !InfrastructureShared
-- Name: 3a787e7b0258
-- Type: 21

if peattributes.isexe and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
