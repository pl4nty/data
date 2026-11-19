-- Threat: !InfrastructureShared
-- Name: 4c78634cd70e
-- Type: 21

if epcode[6] == 191 and epcode[11] == 185 and epcode[16] == 73 and epcode[17] == 128 and epcode[21] == 133 and epcode[23] == 117 then
  return mp.INFECTED
end
return mp.CLEAN
