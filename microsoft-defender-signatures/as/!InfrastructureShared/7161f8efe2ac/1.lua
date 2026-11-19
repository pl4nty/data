-- Threat: !InfrastructureShared
-- Name: 7161f8efe2ac
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
