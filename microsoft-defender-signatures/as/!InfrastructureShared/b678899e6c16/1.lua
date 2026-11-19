-- Threat: !InfrastructureShared
-- Name: b678899e6c16
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
