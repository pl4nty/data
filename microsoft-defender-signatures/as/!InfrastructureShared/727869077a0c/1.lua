-- Threat: !InfrastructureShared
-- Name: 727869077a0c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() == 119296 then
  return mp.INFECTED
end
return mp.CLEAN
