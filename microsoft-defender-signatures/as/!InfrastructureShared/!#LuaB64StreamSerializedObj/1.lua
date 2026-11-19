-- Threat: !InfrastructureShared
-- Name: !#Lua:B64StreamSerializedObj
-- Type: 13
-- MpAttributes: SLF:B64StreamSerializedObj & (BM_TEXT_FILE | BM_XML_FILE | BM_UNKNOWN_FILE)

local l_0_0 = mp.getfilesize()
if 983040 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
l_0_1 = string.gsub(l_0_1, " ", "")
l_0_1 = string.gsub(l_0_1, "\t", "")
l_0_1 = string.gsub(l_0_1, "\n", "")
l_0_1 = string.gsub(l_0_1, "\r", "")
l_0_1 = string.gsub(l_0_1, "\"%+\"", "")
l_0_1 = string.gsub(l_0_1, "\"%w-=%w-&\"", "")
local l_0_2 = string.match(l_0_1, "=\"(AAEAAAD/////AQAAAAAAAAAEAQAAACJT.-)\"")
if l_0_2 then
  local l_0_3 = MpCommon.Base64Decode(l_0_2)
  if l_0_3 == nil or l_0_3 == "" then
    return mp.CLEAN
  end
  local l_0_4 = string.find(l_0_3, "MZ\144\000", 1, true)
  if l_0_4 then
    local l_0_5 = l_0_3:sub(l_0_4)
    mp.vfo_add_buffer(l_0_5, "[SerializedObj]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  end
end
return mp.INFECTED
