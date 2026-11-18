-- Threat: !InfrastructureShared
-- Name: 5b787fc1733e
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
