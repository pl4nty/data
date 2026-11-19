-- Threat: !InfrastructureShared
-- Name: ee78e9e19072
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
