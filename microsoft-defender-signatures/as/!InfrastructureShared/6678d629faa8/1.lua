-- Threat: !InfrastructureShared
-- Name: 6678d629faa8
-- Type: 21

if peattributes.isdll == false and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
