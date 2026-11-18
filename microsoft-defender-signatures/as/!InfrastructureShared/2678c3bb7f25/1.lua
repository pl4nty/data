-- Threat: !InfrastructureShared
-- Name: 2678c3bb7f25
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
