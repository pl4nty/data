-- Threat: !InfrastructureShared
-- Name: 14178130b0557
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
