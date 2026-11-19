-- Threat: !InfrastructureShared
-- Name: 12540b7d78941
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
