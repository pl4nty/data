-- Threat: !InfrastructureShared
-- Name: 9a78dd8543ba
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
