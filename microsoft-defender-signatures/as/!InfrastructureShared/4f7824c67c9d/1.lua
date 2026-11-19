-- Threat: !InfrastructureShared
-- Name: 4f7824c67c9d
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
