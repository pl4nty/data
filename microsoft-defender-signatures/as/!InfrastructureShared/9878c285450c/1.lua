-- Threat: !InfrastructureShared
-- Name: 9878c285450c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
