-- Threat: !InfrastructureShared
-- Name: bb78c3215777
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
