-- Threat: !InfrastructureShared
-- Name: 3678abea2145
-- Type: 21

if peattributes.isexe == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
