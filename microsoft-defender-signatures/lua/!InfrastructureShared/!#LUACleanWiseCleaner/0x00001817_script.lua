-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUACleanWiseCleaner\0x00001817_luac 

-- params : ...
-- function num : 0
local l_0_0 = (pe.get_versioninfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ProductName
if l_0_1 then
  l_0_1 = (string.lower)(l_0_1)
  if (string.find)(l_0_1, "wise care", 1, true) then
    local l_0_2 = l_0_0.ProductVersion
    local l_0_3 = l_0_2:match("([0-9.]+)")
    if compareProductVersion(l_0_3, "6.7.1") == 1 then
      (mp.set_mpattribute)("AllowList:WiseCleaner")
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

