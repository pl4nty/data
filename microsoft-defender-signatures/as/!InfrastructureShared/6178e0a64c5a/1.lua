-- Threat: !InfrastructureShared
-- Name: 6178e0a64c5a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
