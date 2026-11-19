-- Threat: !InfrastructureShared
-- Name: !#ScanDynImp
-- Type: 9

local l_0_0 = pe.get_postemu_sigattr_log_head_size()
if 64 < l_0_0 then
  l_0_0 = 64
end
local l_0_1 = ""
for l_0_2 = 1, l_0_0 do
  local l_0_3 = pe.get_postemu_sigattr_log_head(l_0_2)
  if l_0_3.attribute == 12320 then
    if l_0_3.p1 == nil or l_0_3.p1 == "" then
      return mp.CLEAN
    end
    if string.len(l_0_3.p1) >= 256 then
      return mp.CLEAN
    end
    local l_0_4 = string.lower(l_0_3.p1)
    local l_0_5 = crypto.CRC32Buffer(-1, l_0_4, 0, #l_0_4)
    local l_0_6 = string.char(crypto.bitand(l_0_5, 255), crypto.bitand(crypto.shr32(l_0_5, 8), 255), crypto.bitand(crypto.shr32(l_0_5, 16), 255), crypto.shr32(l_0_5, 24))
    l_0_1 = l_0_1 .. l_0_6
  end
end
if #l_0_1 <= 1 then
  return mp.CLEAN
end
local l_0_7 = crypto.Sha1Buffer(l_0_1, 0, #l_0_1)
mp.set_mpattribute("MpInternal_researchdata=DYNHASH=" .. l_0_7)
local l_0_8 = 207
local l_0_9, l_0_10, l_0_11 = MpCommon.SNidSearch(l_0_8, l_0_7)
if l_0_9 then
  mp.changedetectionrecid(l_0_11)
  return mp.INFECTED
end
return mp.CLEAN
