-- Threat: !InfrastructureShared
-- Name: 3978d009c6f6
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
