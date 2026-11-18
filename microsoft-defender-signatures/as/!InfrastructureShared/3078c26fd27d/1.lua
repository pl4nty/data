-- Threat: !InfrastructureShared
-- Name: 3078c26fd27d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
