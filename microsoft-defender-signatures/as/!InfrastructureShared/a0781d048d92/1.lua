-- Threat: !InfrastructureShared
-- Name: a0781d048d92
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
