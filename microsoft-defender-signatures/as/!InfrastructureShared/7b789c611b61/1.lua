-- Threat: !InfrastructureShared
-- Name: 7b789c611b61
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
