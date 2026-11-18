-- Threat: !InfrastructureShared
-- Name: bc7804a4bbbf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
