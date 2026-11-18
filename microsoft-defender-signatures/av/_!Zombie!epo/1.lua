-- Threat: \xb0!Zombie!epo
-- Type: 8

if pehdr.MinorLinkerVersion ~= 19 then
  return mp.CLEAN
end
if peattributes.lastscn_eqsizes ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections == 0 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\232\006\000\000\000\139d$\b\235Y3\201d\2551d\137!9\vuM9K\004uH\140\200\131\224",
    xray_type = 0,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\006\000\000\000r\237\248\195\249\195S\232\t\000\000\000\139d$\b\235\127\144\144\1443\201d\2551d",
    xray_type = 0,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 2, -1, -8192, -2048)
