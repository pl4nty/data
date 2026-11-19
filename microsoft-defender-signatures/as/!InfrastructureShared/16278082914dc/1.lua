-- Threat: !InfrastructureShared
-- Name: 16278082914dc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 3200000 then
  return mp.INFECTED
end
return mp.CLEAN
