-- Threat: !InfrastructureShared
-- Name: 4278fe262cad
-- Type: 21

if epcode[2] == 131 and epcode[3] == 236 and epcode[5] == 232 and epcode[11] == 131 and epcode[12] == 196 and epcode[14] == 233 then
  return mp.INFECTED
end
return mp.CLEAN
