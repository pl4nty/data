-- Threat: !InfrastructureShared
-- Name: 31786198de59
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
