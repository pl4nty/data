-- Threat: !InfrastructureShared
-- Name: 2178a4e4ac96
-- Type: 21

if peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
