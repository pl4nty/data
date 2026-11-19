-- Threat: !InfrastructureShared
-- Name: d378aecc3db1
-- Type: 21

if not peattributes.ismsil then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 16777216 < l_0_0 then
  return mp.CLEAN
end
local l_0_1
if hstrlog[3].matched then
  l_0_1 = hstrlog[3].VA
elseif hstrlog[4].matched then
  l_0_1 = hstrlog[4].VA
else
  return mp.CLEAN
end
if not pe.contains_va(1, l_0_1) then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2 = mp.readfile(pesecs[1].PointerToRawData, pesecs[1].SizeOfRawData)
if #l_0_2 < 4096 and 16777216 < #l_0_2 then
  return mp.CLEAN
end
for l_0_3 in string.gmatch(l_0_2, "zsrvvgEAAA[%w+/]+=?=?") do
  if 4096 < #l_0_3 then
    mp.set_mpattribute("//MpBase64DecodeLongLines")
    mp.vfo_add_buffer(l_0_3, "[Obfuscator.AO]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    break
  end
end
return mp.INFECTED
