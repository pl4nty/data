-- Threat: !InfrastructureShared
-- Name: 8a7828d2183c
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
