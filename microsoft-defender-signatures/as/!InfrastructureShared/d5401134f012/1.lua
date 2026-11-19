-- Threat: !InfrastructureShared
-- Name: d5401134f012
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 30000000 then
  return mp.INFECTED
end
return mp.CLEAN
