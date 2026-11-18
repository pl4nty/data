-- Threat: !InfrastructureShared
-- Name: 4e789bc6f91d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
