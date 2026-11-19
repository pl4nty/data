-- Threat: !InfrastructureShared
-- Name: d97815dbee0d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and mp.getfilesize() >= 17000 then
  return mp.INFECTED
end
return mp.CLEAN
