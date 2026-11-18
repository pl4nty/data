-- Threat: !InfrastructureShared
-- Name: 6278a06f2f7b
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
