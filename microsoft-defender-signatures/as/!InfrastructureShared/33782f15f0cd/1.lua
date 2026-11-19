-- Threat: !InfrastructureShared
-- Name: 33782f15f0cd
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
