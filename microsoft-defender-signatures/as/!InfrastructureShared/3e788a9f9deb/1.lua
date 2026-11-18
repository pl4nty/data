-- Threat: !InfrastructureShared
-- Name: 3e788a9f9deb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
