-- Threat: !InfrastructureShared
-- Name: 19c786e118726
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
