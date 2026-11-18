-- Threat: !InfrastructureShared
-- Name: b8788a363bcc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
