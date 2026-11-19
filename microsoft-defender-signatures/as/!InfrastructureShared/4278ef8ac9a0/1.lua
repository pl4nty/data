-- Threat: !InfrastructureShared
-- Name: 4278ef8ac9a0
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() >= 400000 and mp.getfilesize() <= 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
