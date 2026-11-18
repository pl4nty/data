-- Threat: !InfrastructureShared
-- Name: e278c3e763eb
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
