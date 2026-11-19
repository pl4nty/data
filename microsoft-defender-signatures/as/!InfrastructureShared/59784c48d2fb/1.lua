-- Threat: !InfrastructureShared
-- Name: 59784c48d2fb
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
