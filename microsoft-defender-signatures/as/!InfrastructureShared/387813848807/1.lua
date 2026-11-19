-- Threat: !InfrastructureShared
-- Name: 387813848807
-- Type: 21

if peattributes.isdll and epcode[1] == 106 and epcode[2] == 16 and epcode[3] == 104 and epcode[4] == 0 and epcode[5] == 2 and epcode[6] == 0 and epcode[7] == 0 and epcode[8] == 104 and epcode[9] == 44 and epcode[10] == 250 and epcode[11] == 250 and epcode[12] == 255 then
  return mp.INFECTED
end
return mp.CLEAN
