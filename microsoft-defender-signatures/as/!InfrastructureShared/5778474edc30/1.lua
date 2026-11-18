-- Threat: !InfrastructureShared
-- Name: 5778474edc30
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
