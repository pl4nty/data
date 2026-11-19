-- Threat: !InfrastructureShared
-- Name: 6a785ab34b7e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
