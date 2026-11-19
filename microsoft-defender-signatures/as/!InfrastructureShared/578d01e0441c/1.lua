-- Threat: !InfrastructureShared
-- Name: 578d01e0441c
-- Type: 21

local l_0_0 = mp.getfilesize()
if 16777216 < l_0_0 then
  return mp.CLEAN
end
if machoLC.__TEXT.__cstring.Size > 16 and machoLC.__TEXT.__cstring.Offset > 0 and l_0_0 > machoLC.__TEXT.__cstring.Offset + machoLC.__TEXT.__cstring.Size then
  mp.readprotection(false)
  local l_0_1 = mp.readfile(machoLC.__TEXT.__cstring.Offset, machoLC.__TEXT.__cstring.Size)
  mp.readprotection(true)
  if #l_0_1 < 16 and 16777216 < #l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = string.find(l_0_1, "b64decode(", 1, true)
  if l_0_2 ~= nil then
    l_0_2 = l_0_2 + 11
    local l_0_3 = string.sub(l_0_1, l_0_2)
    local l_0_4 = MpCommon.Base64Decode(l_0_3)
    if l_0_4 ~= nil and l_0_4 ~= "" then
      mp.set_mpattribute("//MpBase64DecodeLongLines")
      mp.vfo_add_buffer(l_0_4, "[PyMacB64]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    end
  end
end
return mp.INFECTED
