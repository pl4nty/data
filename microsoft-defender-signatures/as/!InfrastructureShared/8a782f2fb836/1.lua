-- Threat: !InfrastructureShared
-- Name: 8a782f2fb836
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
