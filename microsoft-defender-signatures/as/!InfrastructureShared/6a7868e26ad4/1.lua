-- Threat: !InfrastructureShared
-- Name: 6a7868e26ad4
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
