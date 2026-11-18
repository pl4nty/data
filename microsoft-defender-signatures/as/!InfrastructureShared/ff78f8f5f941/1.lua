-- Threat: !InfrastructureShared
-- Name: ff78f8f5f941
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
