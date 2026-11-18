-- Threat: !InfrastructureShared
-- Name: 2f788bd515e3
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
