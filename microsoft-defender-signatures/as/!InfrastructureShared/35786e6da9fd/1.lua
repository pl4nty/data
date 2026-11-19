-- Threat: !InfrastructureShared
-- Name: 35786e6da9fd
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
