-- Threat: !InfrastructureShared
-- Name: !#Lua:PKL_Protocol_Version
-- Type: 12
-- MpAttributes: (Lua:PKLExt | Lua:DATAExt | Lua:DATExt)

if mp.HEADERPAGE_SZ < 256 then
  return mp.CLEAN
end
local l_0_0 = mp.readu_u16(headerpage, 1)
local l_0_1 = false
if l_0_0 == 640 then
  l_0_1 = true
  mp.set_mpattribute("Lua:PKL_Protocol_V2")
elseif l_0_0 == 896 then
  l_0_1 = true
  mp.set_mpattribute("Lua:PKL_Protocol_V3")
elseif l_0_0 == 1152 then
  l_0_1 = true
  mp.set_mpattribute("Lua:PKL_Protocol_V4")
elseif l_0_0 == 1408 then
  l_0_1 = true
  mp.set_mpattribute("Lua:PKL_Protocol_V5")
end
if l_0_1 then
  mp.set_mpattribute("BM_PKL_FILE")
end
return mp.CLEAN
