-- Threat: !InfrastructureShared
-- Name: 17978c7e208ed
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
