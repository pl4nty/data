-- Threat: \xb0!Babylonia!epo
-- Type: 8

if peattributes.lastscn_falign == false then
  return mp.CLEAN
end
if mp.bitand(pesecs[1].Characteristics, 3758096416) ~= 3758096416 then
  return mp.CLEAN
end
if mp.bitand(pesecs[pehdr.NumberOfSections].Characteristics, 3221225536) ~= 3221225536 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData < 11036 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\200 \000\000QS\139]\f\128\251!t\b\128\251$t\003\128\251%\144\233",
    xray_type = 0,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, -1, 0, -1)
