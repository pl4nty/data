-- Threat: !InfrastructureShared
-- Name: !#Lua:PwsZlibSwcMZ
-- Type: 13
-- MpAttributes: BM_SWF_FILE

if not mp.get_mpattribute("PACKED_WITH:(SWC)") then
  return mp.CLEAN
end
local l_0_0 = string.lower(mp.getfilename())
if not mp.get_mpattributesubstring("->[pwszlib]->(swc)") and not string.find(l_0_0, "%->%[pwszlib%].*%->%(swc%)") then
  return mp.CLEAN
end
mp.set_mpattribute("Lua:VpathPwsZlibSwc")
if mp.readu_u16(headerpage, 9) ~= 23117 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if 1000000 < l_0_1 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2 = mp.readfile(8, l_0_1 - 8)
mp.vfo_add_buffer(l_0_2, "[PwsZlibSwcMZ]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.INFECTED
