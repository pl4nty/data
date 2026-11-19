-- Threat: !InfrastructureShared
-- Name: 8f410a425b64
-- Type: 21

if pesecs[1].SizeOfRawData ~= 1536 then
  return mp.CLEAN
end
return mp.INFECTED
