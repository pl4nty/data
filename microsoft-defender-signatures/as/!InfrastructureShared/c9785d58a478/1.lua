-- Threat: !InfrastructureShared
-- Name: c9785d58a478
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
