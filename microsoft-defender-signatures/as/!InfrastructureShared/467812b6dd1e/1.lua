-- Threat: !InfrastructureShared
-- Name: 467812b6dd1e
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
