-- Threat: !InfrastructureShared
-- Name: cf786ad31c42
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
