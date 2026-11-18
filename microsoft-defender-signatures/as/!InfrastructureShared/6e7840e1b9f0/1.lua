-- Threat: !InfrastructureShared
-- Name: 6e7840e1b9f0
-- Type: 21

if peattributes.ismsil == true and (peattributes.isexe == true or peattributes.isdll == true) and mp.getfilesize() <= 1804800 then
  return mp.INFECTED
end
return mp.CLEAN
