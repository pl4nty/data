-- Threat: !InfrastructureShared
-- Name: !#LUA:XorClassFile.A
-- Type: 13
-- Includes: ConversionToBinary_fastBinaryTransform

if mp.bitxor(headerpage[1], headerpage[2]) ~= 52 then
  return mp.CLEAN
end
if mp.bitxor(mp.readu_u16(headerpage, 1), mp.readu_u16(headerpage, 3)) ~= 16496 then
  return mp.CLEAN
end
local l_0_0 = mp.bitxor(headerpage[1], 202)
if l_0_0 == 0 then
  return mp.CLEAN
end
if mp.bitxor(headerpage[2], l_0_0) ~= 254 or mp.bitxor(headerpage[3], l_0_0) ~= 186 or mp.bitxor(headerpage[4], l_0_0) ~= 190 then
  return mp.CLEAN
end
if headerpage[5] ~= l_0_0 or headerpage[6] ~= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if 786432 < l_0_1 or l_0_1 < 256 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2 = mp.readfile(0, l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
mp.vfo_add_buffer(fastBinaryTransform(l_0_2, "(.)", l_0_0, mp.bitxor), "[XorJavaClass]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
