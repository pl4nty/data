-- Threat: !InfrastructureShared
-- Name: c9787197b9b4
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 13000 then
  return mp.INFECTED
end
return mp.CLEAN
