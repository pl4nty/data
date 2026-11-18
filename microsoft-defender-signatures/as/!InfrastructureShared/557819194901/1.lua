-- Threat: !InfrastructureShared
-- Name: 557819194901
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
