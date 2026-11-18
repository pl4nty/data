-- Threat: !InfrastructureShared
-- Name: !#Lua:CmdEscapeChar
-- Type: 13

if not mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 1048576 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
if string.find(l_0_1, "%^") then
  l_0_1 = string.gsub(l_0_1, "%^", "")
  mp.vfo_add_buffer(l_0_1, "[CmdEscapeChar]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
end
return mp.CLEAN
