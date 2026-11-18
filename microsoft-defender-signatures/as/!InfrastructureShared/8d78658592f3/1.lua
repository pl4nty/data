-- Threat: !InfrastructureShared
-- Name: 8d78658592f3
-- Type: 21

if peattributes.isvbnative and pesecs[3].SizeOfRawData > 65536 then
  return mp.INFECTED
end
return mp.CLEAN
