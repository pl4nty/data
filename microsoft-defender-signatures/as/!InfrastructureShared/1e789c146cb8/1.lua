-- Threat: !InfrastructureShared
-- Name: 1e789c146cb8
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
