-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUALNKPowEncCmdLnkB\1_luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("PACKED_WITH:[CMDEmbedded]") then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 64 or l_0_0 > 65536 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1 = tostring((mp.readfile)(0, l_0_0))
local l_0_2 = (string.match)(l_0_1, "-[Ee][Nn][Cc][Oo][Dd][Ee][Dd][Cc][Oo][Mm][Mm][Aa][Nn][Dd]%s+\"([^\"]+)\"")
if l_0_2 == nil then
  return mp.CLEAN
end
;
(mp.vfo_add_buffer)((MpCommon.Base64Decode)(l_0_2), "[PowEncCmdLnk]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN

