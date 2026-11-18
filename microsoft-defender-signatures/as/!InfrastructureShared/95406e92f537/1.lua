-- Threat: !InfrastructureShared
-- Name: 95406e92f537
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and mp.getfilesize() < 5000 then
  return mp.INFECTED
end
return mp.CLEAN
