-- Threat: !InfrastructureShared
-- Name: 65785a67bb8e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
