-- Threat: !InfrastructureShared
-- Name: 8178f1e6c78e
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
