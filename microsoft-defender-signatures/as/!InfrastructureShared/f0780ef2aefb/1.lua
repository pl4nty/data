-- Threat: !InfrastructureShared
-- Name: f0780ef2aefb
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
