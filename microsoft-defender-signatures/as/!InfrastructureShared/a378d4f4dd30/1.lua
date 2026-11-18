-- Threat: !InfrastructureShared
-- Name: a378d4f4dd30
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() == 6125056 then
  return mp.INFECTED
end
return mp.CLEAN
