-- Threat: !InfrastructureShared
-- Name: 36789d0f0fdd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
