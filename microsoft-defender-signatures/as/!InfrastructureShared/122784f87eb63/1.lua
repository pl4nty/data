-- Threat: !InfrastructureShared
-- Name: 122784f87eb63
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
