-- Threat: !InfrastructureShared
-- Name: c77837f420d6
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
