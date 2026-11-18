-- Threat: !InfrastructureShared
-- Name: cd78591a07e8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
