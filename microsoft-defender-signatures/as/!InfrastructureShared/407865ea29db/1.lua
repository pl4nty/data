-- Threat: !InfrastructureShared
-- Name: 407865ea29db
-- Type: 21

if peattributes.ismsil == true and (peattributes.isdll or peattributes.isexe) then
  return mp.INFECTED
end
return mp.CLEAN
