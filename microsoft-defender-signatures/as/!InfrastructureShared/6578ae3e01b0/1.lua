-- Threat: !InfrastructureShared
-- Name: 6578ae3e01b0
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
