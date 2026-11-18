-- Threat: \xb0!Drivalon!epo
-- Type: 8

if doshdr.e_csum ~= 22614 then
  return mp.CLEAN
end
if peattributes.lastscn_falign == false then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\137\208Jf\129:MZu\248\137\209\139I<\001",
    xray_type = 0,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, -1, -2048, -1024)
