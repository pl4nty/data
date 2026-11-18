-- Threat: !InfrastructureShared
-- Name: 3378e93a2242
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
