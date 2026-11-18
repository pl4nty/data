-- Threat: !InfrastructureShared
-- Name: 5a78611c772c
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
