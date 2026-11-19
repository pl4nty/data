-- Threat: !InfrastructureShared
-- Name: 676172e70c66
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
