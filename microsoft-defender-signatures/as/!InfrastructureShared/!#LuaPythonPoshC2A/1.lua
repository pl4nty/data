-- Threat: !InfrastructureShared
-- Name: !#Lua:Python/PoshC2.A
-- Type: 13
-- MpAttributes: TEL:Python/ExecB64decode

local l_0_0 = mp.getfilesize()
if 122880 < l_0_0 then
  return mp.CLEAN
end
local l_0_1
if l_0_0 <= mp.HEADERPAGE_SZ then
  l_0_1 = tostring(headerpage)
else
  mp.readprotection(false)
  l_0_1 = tostring(mp.readfile(0, l_0_0))
end
local l_0_2 = string.match(l_0_1, "base64.b64decode%('([%w%+/]+=-)'%)")
if l_0_2 == nil or string.len(l_0_2) < 128 then
  return mp.CLEAN
end
mp.vfo_add_buffer(l_0_2, "[PythonBase64]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.INFECTED
