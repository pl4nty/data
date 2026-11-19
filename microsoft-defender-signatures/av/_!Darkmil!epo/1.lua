-- Threat: \xb0!Darkmil!epo
-- Type: 8

if peattributes.epcallnext == false then
  return mp.CLEAN
end
if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if peattributes.epscn_islast == false then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "dg\161\000\000\137\1334\"@\000\137\1338\"@\000\141\133$",
    xray_type = 1,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, -2, 0, 2048)
