-- Threat: !InfrastructureShared
-- Name: 87788a002527
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
