-- Threat: !InfrastructureShared
-- Name: 4d78429c7ed2
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
