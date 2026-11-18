-- Threat: !InfrastructureShared
-- Name: 7578db467abc
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
