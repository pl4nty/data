-- Threat: !InfrastructureShared
-- Name: 109781cef300a
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
