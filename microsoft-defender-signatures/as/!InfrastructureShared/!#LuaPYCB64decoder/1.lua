-- Threat: !InfrastructureShared
-- Name: !#Lua:PYC.B64decoder
-- Type: 13
-- MpAttributes: !RPF:TopLevelFile

if not mp.get_mpattribute("AGGR:PYC.B64decoder!filter") then
  return mp.CLEAN
end
if not mp.get_mpattribute("PACKED_WITH:[PyInsObj]") and not mp.get_mpattribute("PACKED_WITH:[py2exebin]") then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, 1) ~= 227 and mp.readu_u16(headerpage, 1) ~= 13330 then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 4096 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
local l_0_2 = 0
for l_0_3 in l_0_1:gmatch("%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w+") do
  if string.len(l_0_3) >= 128 then
    local l_0_4 = MpCommon.Base64Decode(l_0_3)
    if l_0_4 ~= nil and l_0_4 ~= "" then
      mp.vfo_add_buffer(l_0_4, string.format("[PythonBase64][%02X]", l_0_2), mp.ADD_VFO_TAKE_ACTION_ON_DAD)
      l_0_2 = l_0_2 + 1
    end
  end
end
return mp.CLEAN
