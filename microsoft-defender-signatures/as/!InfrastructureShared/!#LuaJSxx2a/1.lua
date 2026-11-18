-- Threat: !InfrastructureShared
-- Name: !#Lua:JSxx2a
-- Type: 13
-- MpAttributes: SCRIPT:JS/Obfuscator.HexMixed.C & BM_UNKNOWN_FILE & RPF:TopLevelFile

local l_0_0 = mp.getfilesize()
if 1048576 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
l_0_1 = string.gsub(l_0_1, "%%(%x%x)", function(l_1_0)
  return string.char(tonumber(l_1_0, 16))
end)
mp.vfo_add_buffer(l_0_1, "[JSxx2a]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
