-- Threat: !InfrastructureShared
-- Name: a27811c65203
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
