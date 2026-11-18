-- Threat: !InfrastructureShared
-- Name: d0787f7c493e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
