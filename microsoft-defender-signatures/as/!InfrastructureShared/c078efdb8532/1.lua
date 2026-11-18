-- Threat: !InfrastructureShared
-- Name: c078efdb8532
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
