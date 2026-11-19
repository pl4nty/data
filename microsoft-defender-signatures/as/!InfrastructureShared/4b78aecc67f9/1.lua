-- Threat: !InfrastructureShared
-- Name: 4b78aecc67f9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
