-- Threat: !InfrastructureShared
-- Name: 7d784e24209d
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
