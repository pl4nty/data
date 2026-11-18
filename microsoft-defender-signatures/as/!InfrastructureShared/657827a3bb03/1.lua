-- Threat: !InfrastructureShared
-- Name: 657827a3bb03
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
