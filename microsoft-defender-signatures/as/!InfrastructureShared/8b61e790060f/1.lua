-- Threat: !InfrastructureShared
-- Name: 8b61e790060f
-- Type: 21

if peattributes.isexe == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
