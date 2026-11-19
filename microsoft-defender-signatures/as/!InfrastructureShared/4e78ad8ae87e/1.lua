-- Threat: !InfrastructureShared
-- Name: 4e78ad8ae87e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
