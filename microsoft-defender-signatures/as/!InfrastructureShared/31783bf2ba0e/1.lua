-- Threat: !InfrastructureShared
-- Name: 31783bf2ba0e
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
