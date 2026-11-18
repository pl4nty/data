-- Threat: !InfrastructureShared
-- Name: 19a78ff4b3e87
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 3145728 then
  return mp.INFECTED
end
return mp.CLEAN
