-- Threat: !InfrastructureShared
-- Name: 16e78c3bc9834
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
