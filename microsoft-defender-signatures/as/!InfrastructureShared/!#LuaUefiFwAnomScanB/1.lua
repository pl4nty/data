-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaUefiFwAnomScanB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 5242880 or l_0_0 < 3072 then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if (string.find)(l_0_1, "CppcDxe", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_2 = (mp.enum_mpattributesubstring)("CMN:HSTR:UefiUtils")
local l_0_3 = false
if #l_0_2 > 0 then
  return mp.CLEAN
end
local l_0_4 = tostring((pesecs[pevars.epsec]).Name)
if l_0_4 == nil then
  return mp.CLEAN
end
if l_0_4 ~= ".text" then
  (mp.set_mpattribute)("Lua:UefiFwAnomEntry")
  l_0_3 = true
end
if l_0_3 == true then
  return mp.INFECTED
end
return mp.CLEAN

