-- Threat: !InfrastructureShared
-- Name: 3b784cd370a6
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
