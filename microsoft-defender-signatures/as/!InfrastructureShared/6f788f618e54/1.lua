-- Threat: !InfrastructureShared
-- Name: 6f788f618e54
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
