-- Threat: !InfrastructureShared
-- Name: 15781ea7f353
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
