-- Threat: !InfrastructureShared
-- Name: 497809b2b2b3
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
