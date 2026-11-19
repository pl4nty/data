-- Threat: !InfrastructureShared
-- Name: 3778c2cadf74
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
