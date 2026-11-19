-- Threat: !InfrastructureShared
-- Name: !#Lua:MSILBundle
-- Type: 13
-- MpAttributes: BM_SWF_FILE

if not mp.get_mpattribute("PACKED_WITH:(SWC)") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename()
local l_0_1 = string.find(l_0_0, "-[DotNetCompressed]->(SWC)", 1, true)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = l_0_1 - 1
local l_0_2 = string.find(l_0_0, "->", 1, true) + 2
if mp.readu_u16(headerpage, 9) ~= 23117 then
  return mp.CLEAN
end
local l_0_3 = mp.getfilesize()
if 1048576 < l_0_3 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_4 = mp.readfile(8, l_0_3 - 8)
mp.vfo_add_buffer(l_0_4, l_0_0:sub(l_0_2, l_0_1), mp.ADD_VFO_TAKE_ACTION_ON_DAD)
mp.UfsSetMetadataBool("DotNetCoreBundleExtracts", true, true)
mp.readprotection(true)
return mp.INFECTED
