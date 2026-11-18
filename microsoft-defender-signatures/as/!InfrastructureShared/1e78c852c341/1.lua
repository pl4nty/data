-- Threat: !InfrastructureShared
-- Name: 1e78c852c341
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
