-- Threat: !InfrastructureShared
-- Name: 267893ecf553
-- Type: 21

if peattributes.isexe == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
