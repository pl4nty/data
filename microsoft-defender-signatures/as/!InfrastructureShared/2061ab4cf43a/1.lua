-- Threat: !InfrastructureShared
-- Name: 2061ab4cf43a
-- Type: 21

if peattributes.isexe == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
