-- Threat: !InfrastructureShared
-- Name: 2b78948b1af0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
