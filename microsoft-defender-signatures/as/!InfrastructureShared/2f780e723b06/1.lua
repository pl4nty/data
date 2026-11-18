-- Threat: !InfrastructureShared
-- Name: 2f780e723b06
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
