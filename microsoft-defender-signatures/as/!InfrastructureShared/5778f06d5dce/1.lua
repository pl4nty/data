-- Threat: !InfrastructureShared
-- Name: 5778f06d5dce
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
