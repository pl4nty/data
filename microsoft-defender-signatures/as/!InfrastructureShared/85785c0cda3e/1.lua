-- Threat: !InfrastructureShared
-- Name: 85785c0cda3e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
