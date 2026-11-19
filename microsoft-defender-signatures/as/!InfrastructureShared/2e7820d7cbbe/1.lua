-- Threat: !InfrastructureShared
-- Name: 2e7820d7cbbe
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
