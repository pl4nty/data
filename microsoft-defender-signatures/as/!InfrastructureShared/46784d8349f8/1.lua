-- Threat: !InfrastructureShared
-- Name: 46784d8349f8
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
