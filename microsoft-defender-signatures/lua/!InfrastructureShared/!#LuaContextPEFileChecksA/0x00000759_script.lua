-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaContextPEFileChecksA\0x00000759_luac 

-- params : ...
-- function num : 0
if pehdr == nil or pehdr.NumberOfSections == nil or pesecs == nil then
  return mp.CLEAN
end
local l_0_0 = pehdr.NumberOfSections
local l_0_1 = (pesecs[l_0_0]).PointerToRawData + (pesecs[l_0_0]).SizeOfRawData
local l_0_2 = (mp.getfilesize)()
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
if l_0_2 < l_0_1 then
  (mp.set_mpattribute)("Lua:Context/PeFileTruncated.A!lastsection")
end
do
  if l_0_0 > 1 then
    local l_0_3 = (pesecs[l_0_0 - 1]).PointerToRawData + (pesecs[l_0_0 - 1]).SizeOfRawData
    if l_0_3 ~= nil and l_0_2 < l_0_3 then
      (mp.set_mpattribute)("Lua:Context/PeFileTruncated.A!secondlastsection")
    end
  end
  return mp.CLEAN
end

