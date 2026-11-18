-- Threat: !InfrastructureShared
-- Name: !#LUA:O97M/Base64InMSG
-- Type: 12

if not mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 100000 then
  return mp.CLEAN
end
if 500000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
if nil == string.match(l_0_1, "Content%-Transfer%-Encoding%: BASE64\\par") then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2 = mp.readfile(0, l_0_0)
local l_0_3 = string.gsub(l_0_2, "^%{\\rtf1\\.*PC%/Binary\\par\r\n\\par\r\n", "")
l_0_3 = string.gsub(l_0_3, "\\par\r\n\\par\r\n.*$", "")
l_0_3 = string.gsub(l_0_3, "\\par\r\n", "\r\n")
mp.vfo_add_buffer(l_0_3, "[MSG_Base64]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
