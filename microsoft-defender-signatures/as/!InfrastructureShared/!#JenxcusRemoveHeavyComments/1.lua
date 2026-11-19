-- Threat: !InfrastructureShared
-- Name: !#JenxcusRemoveHeavyComments
-- Type: 13
-- MpAttributes: PossibleJenxcusObfuscator & !TOLUA:ScriptNullHeader

local l_0_0 = mp.getfilesize()
if 2097152 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
if nil == string.match(l_0_1, "^%s-'") then
  return mp.CLEAN
end
local l_0_2 = 1
if l_0_1[#l_0_1] ~= "\n" then
  l_0_1 = l_0_1 .. "\n"
  l_0_2 = 0
end
local l_0_3, l_0_4 = l_0_1:gsub("'.-\n", ""):gsub("%s+", "")
if 0 < #l_0_3 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_5 = mp.readfile(mp.FOOTERPAGE_SZ, l_0_0 - mp.FOOTERPAGE_SZ)
if l_0_2 == 0 then
  l_0_5 = "'" .. l_0_5
end
if l_0_5[l_0_5] ~= "\n" then
  l_0_5 = l_0_5 .. "\n"
end
local l_0_6, l_0_7 = l_0_5:gsub("'.-\n", "")
mp.vfo_add_buffer(l_0_6, "[JXSStrip]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
