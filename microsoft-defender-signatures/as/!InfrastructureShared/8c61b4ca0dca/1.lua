-- Threat: !InfrastructureShared
-- Name: 8c61b4ca0dca
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
