-- Threat: !InfrastructureShared
-- Name: 7778e3062cdb
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
