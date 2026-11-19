-- Threat: !InfrastructureShared
-- Name: 84780456c077
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
