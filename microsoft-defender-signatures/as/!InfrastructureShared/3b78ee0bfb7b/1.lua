-- Threat: !InfrastructureShared
-- Name: 3b78ee0bfb7b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
