-- Threat: !InfrastructureShared
-- Name: !#Lua:IntentToInjectResScan
-- Type: 12
-- MpAttributes: MpInternal_IsPliScan

if not mp.get_mpattribute("PACKED_WITH:[EmbeddedResource]") then
  return mp.CLEAN
end
if mp.readu_u64(headerpage, 1) ~= -8554208160678674200 then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pcall(mp.BMSearchFile, 0, mp.HEADERPAGE_SZ, "MZ\144\000\003\144\000")
if not l_0_0 then
  return mp.CLEAN
end
l_0_1 = l_0_1 and l_0_1 + 1
local l_0_2 = mp.readu_u32(headerpage, l_0_1 + 60)
if mp.readu_u16(headerpage, l_0_1 + l_0_2) ~= 17744 then
  return mp.CLEAN
end
local l_0_3 = mp.getfilesize()
if l_0_3 == nil or 10485760 < l_0_3 then
  l_0_3 = 10485760
end
local l_0_4 = mp.readu_u16(headerpage, l_0_1 + l_0_2 + 22)
if mp.bitand(l_0_4, 8192) then
  mp.set_mpattribute("Lua:DLLInEmbeddedResource")
  mp.readprotection(false)
  local l_0_5 = mp.readfile(l_0_1 - 1, l_0_3 - l_0_1 - 1)
  mp.readprotection(true)
  mp.vfo_add_buffer(l_0_5, "[ShelcoridDll]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  return mp.INFECTED
end
return mp.CLEAN
