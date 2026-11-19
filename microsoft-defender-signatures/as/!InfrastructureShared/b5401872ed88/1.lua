-- Threat: !InfrastructureShared
-- Name: b5401872ed88
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
