-- Threat: !InfrastructureShared
-- Name: e54055c89aee
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
