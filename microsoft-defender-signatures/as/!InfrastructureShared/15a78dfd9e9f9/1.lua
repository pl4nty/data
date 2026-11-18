-- Threat: !InfrastructureShared
-- Name: 15a78dfd9e9f9
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
