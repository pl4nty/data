-- Threat: !InfrastructureShared
-- Name: 4d78f9b810b3
-- Type: 21

if peattributes.isexe == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
