-- Threat: !InfrastructureShared
-- Name: 106787e298866
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
