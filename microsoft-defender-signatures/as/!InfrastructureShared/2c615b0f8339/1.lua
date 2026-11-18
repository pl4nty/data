-- Threat: !InfrastructureShared
-- Name: 2c615b0f8339
-- Type: 21

if peattributes.isexe == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
