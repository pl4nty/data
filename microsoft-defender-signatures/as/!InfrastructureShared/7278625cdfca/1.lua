-- Threat: !InfrastructureShared
-- Name: 7278625cdfca
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
