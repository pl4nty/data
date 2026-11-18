-- Threat: !InfrastructureShared
-- Name: 6d786e4a86e3
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
