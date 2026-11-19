-- Threat: !InfrastructureShared
-- Name: !#LUA:AutoItLargeFile
-- Type: 10

if mp.ispackedwith("AutoIt_+") and mp.getfilesize() >= 4194304 and not peattributes.isreported then
  return mp.INFECTED
end
return mp.CLEAN
