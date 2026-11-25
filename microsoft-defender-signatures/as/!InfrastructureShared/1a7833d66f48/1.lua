-- Threat: !InfrastructureShared
-- Name: 1a7833d66f48
-- Type: 21

if peattributes.isexe == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
