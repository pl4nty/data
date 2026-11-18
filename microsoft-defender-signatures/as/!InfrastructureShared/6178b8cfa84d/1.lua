-- Threat: !InfrastructureShared
-- Name: 6178b8cfa84d
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 10240 then
  return mp.INFECTED
end
return mp.CLEAN
