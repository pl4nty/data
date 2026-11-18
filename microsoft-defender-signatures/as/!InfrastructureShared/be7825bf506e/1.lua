-- Threat: !InfrastructureShared
-- Name: be7825bf506e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
