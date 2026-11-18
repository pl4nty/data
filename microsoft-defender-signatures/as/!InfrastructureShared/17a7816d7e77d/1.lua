-- Threat: !InfrastructureShared
-- Name: 17a7816d7e77d
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
