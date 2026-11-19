-- Threat: !InfrastructureShared
-- Name: !#Lua:Python/Base64StrDecode.B
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & SCRIPT:PYDecomB64decodExec.A

if mp.get_mpattribute("Lua:FileExtensionAttr!py") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 8388608 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = tostring(mp.readfile(0, l_0_0))
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1:sub(1, 256)
local l_0_3 = l_0_2:find("exec%s*%(%s*[%w_]+%s*%(%s*b'", 1)
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = l_0_3 + l_0_2:sub(l_0_3):find("b'", 1, true) + 1
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = l_0_0 - 256 + 1
if l_0_5 < 1 then
  l_0_5 = 1
end
local l_0_6 = l_0_1:sub(l_0_5, l_0_0)
local l_0_7 = l_0_6:find("'%s*%)%s*%)")
if not l_0_7 then
  return mp.CLEAN
end
local l_0_8 = l_0_5 + l_0_7 - 2
local l_0_9 = l_0_1:sub(l_0_4, l_0_8)
if not l_0_9 then
  return mp.CLEAN
end
l_0_9 = l_0_9:reverse()
local l_0_10 = MpCommon.Base64Decode(l_0_9)
if l_0_10 == nil then
  return mp.CLEAN
end
mp.vfo_add_buffer("CWSHACK\000" .. l_0_10, "[PwsZlib]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
