-- Threat: !InfrastructureShared
-- Name: 7a7814f8c3b0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
