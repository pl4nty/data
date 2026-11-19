-- Threat: !InfrastructureShared
-- Name: 1f786ed721ee
-- Type: 21

if peattributes.isdll or peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
