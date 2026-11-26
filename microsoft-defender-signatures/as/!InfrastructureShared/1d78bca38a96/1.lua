-- Threat: !InfrastructureShared
-- Name: 1d78bca38a96
-- Type: 21

if peattributes.isexe == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
