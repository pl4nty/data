-- Threat: !InfrastructureShared
-- Name: 7e78af3a6774
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
