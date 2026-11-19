-- Threat: !InfrastructureShared
-- Name: dd7884d6af5b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
