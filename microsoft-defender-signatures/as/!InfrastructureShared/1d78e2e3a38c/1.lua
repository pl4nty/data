-- Threat: !InfrastructureShared
-- Name: 1d78e2e3a38c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
