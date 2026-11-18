-- Threat: !InfrastructureShared
-- Name: 6d78398554e0
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
