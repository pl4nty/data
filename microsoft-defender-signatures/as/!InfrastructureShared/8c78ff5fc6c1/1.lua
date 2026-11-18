-- Threat: !InfrastructureShared
-- Name: 8c78ff5fc6c1
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
