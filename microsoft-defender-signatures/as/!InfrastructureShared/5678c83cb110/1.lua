-- Threat: !InfrastructureShared
-- Name: 5678c83cb110
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
