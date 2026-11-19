-- Threat: !InfrastructureShared
-- Name: 367800d6b247
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
