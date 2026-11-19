-- Threat: !InfrastructureShared
-- Name: da78310fa8f6
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
