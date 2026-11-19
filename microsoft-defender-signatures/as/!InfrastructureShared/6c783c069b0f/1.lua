-- Threat: !InfrastructureShared
-- Name: 6c783c069b0f
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
