-- Threat: !InfrastructureShared
-- Name: 13978476a7f88
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 150000 then
  return mp.INFECTED
end
return mp.CLEAN
