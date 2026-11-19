-- Threat: !InfrastructureShared
-- Name: !#Lua:Python/Empyre.A
-- Type: 13
-- MpAttributes: SCPT:MacOS/Empyre

local l_0_0 = mp.getfilesize()
if 10240 < l_0_0 then
  return mp.CLEAN
end
local l_0_1
if l_0_0 <= mp.HEADERPAGE_SZ then
  l_0_1 = tostring(headerpage)
else
  mp.readprotection(false)
  l_0_1 = tostring(mp.readfile(0, l_0_0))
end
local l_0_2 = string.gmatch(l_0_1, "%exec%(base64%.b64decode%('(.+)'%)")
local l_0_3 = 0
for l_0_4 in l_0_2, nil, nil do
  local l_0_5 = MpCommon.Base64Decode(l_0_4)
  if l_0_5 ~= nil and l_0_5 ~= "" then
    mp.vfo_add_buffer(l_0_5, string.format("[PythonBase64][%02X]", l_0_3), mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    l_0_3 = l_0_3 + 1
  end
end
if 0 < l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
