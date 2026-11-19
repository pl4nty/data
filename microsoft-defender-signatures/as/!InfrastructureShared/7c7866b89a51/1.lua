-- Threat: !InfrastructureShared
-- Name: 7c7866b89a51
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
