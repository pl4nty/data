-- Threat: !InfrastructureShared
-- Name: 9f788591f935
-- Type: 21

if peattributes.isexe == true and pehdr.NumberOfSections == 5 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
