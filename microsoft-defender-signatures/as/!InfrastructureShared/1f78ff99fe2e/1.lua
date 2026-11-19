-- Threat: !InfrastructureShared
-- Name: 1f78ff99fe2e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
