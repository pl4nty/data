-- Threat: !InfrastructureShared
-- Name: 9678509a03a1
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
