-- Threat: \xb01Mogul
-- Type: 8

if peattributes.epcallnext == false then
  return mp.CLEAN
end
if epcode[17] ~= 195 then
  return mp.CLEAN
end
if epcode[10] ~= 129 then
  return mp.CLEAN
end
if epcode[6] ~= 131 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "PSQRVWU\139T$\028\232H\006\000\0003\192\143\132\005\161*@\000\131\192\004\131\248\028u",
    xray_type = 3,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, -1, 0, 1024)
