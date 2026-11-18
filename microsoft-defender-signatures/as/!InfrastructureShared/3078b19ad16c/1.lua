-- Threat: !InfrastructureShared
-- Name: 3078b19ad16c
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
