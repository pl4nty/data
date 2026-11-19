-- Threat: !InfrastructureShared
-- Name: 2c78aaae8239
-- Type: 21

if pehdr.NumberOfSections ~= 4 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "f\001\218k\210\003f\247\210\144\193\202\005\137\2150\016",
    xray_type = 3,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, 2, 0, 256)
