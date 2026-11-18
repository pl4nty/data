-- Threat: !InfrastructureShared
-- Name: b978c20c0888
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() <= 200000 then
  return mp.INFECTED
end
return mp.CLEAN
