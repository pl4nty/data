-- Threat: !InfrastructureShared
-- Name: 3d7802fe3db8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
