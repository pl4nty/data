-- Threat: !InfrastructureShared
-- Name: 3e788732ee1a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
