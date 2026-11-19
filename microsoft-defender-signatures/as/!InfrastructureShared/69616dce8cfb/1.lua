-- Threat: !InfrastructureShared
-- Name: 69616dce8cfb
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
