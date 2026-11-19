-- Threat: !InfrastructureShared
-- Name: 797836ef3828
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
