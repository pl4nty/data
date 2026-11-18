-- Threat: !InfrastructureShared
-- Name: a778fff0e56c
-- Type: 21

if peattributes.amd64_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
