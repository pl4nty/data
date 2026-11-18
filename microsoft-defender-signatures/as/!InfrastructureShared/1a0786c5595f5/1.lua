-- Threat: !InfrastructureShared
-- Name: 1a0786c5595f5
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
