-- Threat: !InfrastructureShared
-- Name: 86785be0dddf
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 1350000 then
  return mp.INFECTED
end
return mp.CLEAN
