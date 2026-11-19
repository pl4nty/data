-- Threat: \xb0!Rainsong!epo
-- Type: 8

if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if peattributes.lastscn_falign == false then
  return mp.CLEAN
end
if peattributes.lastscn_valign == false then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "`\232\137\002\000\000\139\133\147\031@\0001\133\160\018",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "`\232\180\002\000\000\139\133\201\016A\0001\133\203\002",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "`\232\180\002\000\000\139\133\201 @\0001\133\203\018",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "`\232\137\002\000\000\139\133A\031@\0001\133\160\018",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232Z\002\000\000X\141\149\000\016@\000+\208\001T",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232Z\002\000\000X\141\149\000\016@\000+\208\001T",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "`\232\137\002\000\000\139\133t\031@\0001\133\160\018",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "`\232\137\002\000\000\139\133\147\015A\0001\133\160\002",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "`\232\137\002\000\000\139\133t\015A\0001\133\160\002",
    xray_type = 1,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 9, -1, -8192, -2048)
