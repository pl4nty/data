-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTruebotSA\0x00001646_luac 

-- params : ...
-- function num : 0
local l_0_0 = (pe.get_versioninfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.CompanyName
if l_0_1 then
  l_0_1 = (string.lower)(l_0_1)
end
if not StringEndsWith(l_0_1, ",corporation") then
  return mp.CLEAN
end
return mp.INFECTED

