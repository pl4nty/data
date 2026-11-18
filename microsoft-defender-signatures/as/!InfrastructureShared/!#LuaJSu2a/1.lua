-- Threat: !InfrastructureShared
-- Name: !#Lua:JSu2a
-- Type: 13
-- MpAttributes: SCRIPT:TrojanDownloader:JS/Obfuscator.Uchunks & BM_UNKNOWN_FILE & RPF:TopLevelFile

local l_0_0 = mp.getfilesize()
if 1048576 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
l_0_1 = string.gsub(l_0_1, "\\u00(%x%x)", function(l_1_0)
  return string.char(tonumber(l_1_0, 16))
end)
l_0_1 = string.gsub(l_0_1, "\" %+ \"", "")
mp.vfo_add_buffer(l_0_1, "[JSu2a]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
