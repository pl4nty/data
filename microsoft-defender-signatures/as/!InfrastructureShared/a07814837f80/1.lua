-- Threat: !InfrastructureShared
-- Name: a07814837f80
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
