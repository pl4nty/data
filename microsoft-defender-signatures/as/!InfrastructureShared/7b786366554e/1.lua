-- Threat: !InfrastructureShared
-- Name: 7b786366554e
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
