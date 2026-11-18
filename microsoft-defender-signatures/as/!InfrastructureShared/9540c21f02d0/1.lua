-- Threat: !InfrastructureShared
-- Name: 9540c21f02d0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
