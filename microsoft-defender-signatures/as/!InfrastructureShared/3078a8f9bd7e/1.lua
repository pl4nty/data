-- Threat: !InfrastructureShared
-- Name: 3078a8f9bd7e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
