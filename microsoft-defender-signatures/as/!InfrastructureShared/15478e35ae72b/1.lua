-- Threat: !InfrastructureShared
-- Name: 15478e35ae72b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
