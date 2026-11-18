-- Threat: !InfrastructureShared
-- Name: 69789406b0f8
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
