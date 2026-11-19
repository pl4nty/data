-- Threat: !InfrastructureShared
-- Name: 35d0ed8a7656
-- Type: 21

local l_0_0 = mp.getfilesize()
if 20480 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.readheader(0, 16)
local l_0_2 = string.find(l_0_1, "\000\001\000\000\000\255\255\255\255\001\000\000\000\000\000\000", 1, true)
if l_0_2 then
  mp.set_mpattribute("BM_SerializedObj.A")
  return mp.INFECTED
end
return mp.CLEAN
