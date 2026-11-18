-- Threat: !InfrastructureShared
-- Name: 5f785d44ae7c
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
