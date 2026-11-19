-- Threat: !InfrastructureShared
-- Name: 31786ff20e26
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
