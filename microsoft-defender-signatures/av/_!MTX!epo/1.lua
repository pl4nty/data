-- Threat: \xb0!MTX!epo
-- Type: 8

if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData < 9245 then
  return mp.CLEAN
end
if peattributes.lastscn_falign == false then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\156`\233\000\000\000\000\190\144\001\004\139\254\185\144\001\002\000\000\252\173\144\001\015\171\226\237\235\004\144\000",
    xray_type = 9,
    bytes_to_decrypt = 0
  },
  {
    sig = "dg\2556\000\000dg\137&\000\000\139H<\139T\b4;\194u\218\139\234\003\193\005\128\000\000\000",
    xray_type = 0,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 2, -1, -10000, -6000)
