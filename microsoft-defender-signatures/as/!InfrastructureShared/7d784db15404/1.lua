-- Threat: !InfrastructureShared
-- Name: 7d784db15404
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
