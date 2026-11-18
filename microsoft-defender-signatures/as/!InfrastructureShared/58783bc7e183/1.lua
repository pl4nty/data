-- Threat: !InfrastructureShared
-- Name: 58783bc7e183
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
