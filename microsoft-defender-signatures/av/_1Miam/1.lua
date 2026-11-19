-- Threat: \xb01Miam
-- Type: 8

if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if peattributes.lastscn_eqsizes == false then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData <= 4000 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\139\194\129\226\000\000\255\255BJf\129:MZu\248\139\202\139I<\003\202;\200\127\237f\1299P",
    xray_type = 0,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, -1, -6000, -3000)
