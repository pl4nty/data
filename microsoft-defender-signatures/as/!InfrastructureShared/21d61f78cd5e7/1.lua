-- Threat: !InfrastructureShared
-- Name: 21d61f78cd5e7
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
