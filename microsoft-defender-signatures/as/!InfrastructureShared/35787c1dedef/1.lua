-- Threat: !InfrastructureShared
-- Name: 35787c1dedef
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
