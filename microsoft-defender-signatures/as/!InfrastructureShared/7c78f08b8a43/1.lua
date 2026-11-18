-- Threat: !InfrastructureShared
-- Name: 7c78f08b8a43
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
