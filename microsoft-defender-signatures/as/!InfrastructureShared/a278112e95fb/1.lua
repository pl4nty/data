-- Threat: !InfrastructureShared
-- Name: a278112e95fb
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
