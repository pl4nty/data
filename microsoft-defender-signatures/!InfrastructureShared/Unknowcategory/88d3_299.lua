-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\88d3_299.luac 

-- params : ...
-- function num : 0
local l_0_0 = (pe.get_versioninfo)()
if l_0_0 ~= nil then
  local l_0_1 = l_0_0.OriginalFilename
  local l_0_2 = l_0_0.ProductName
  if l_0_1 == nil or l_0_2 == nil then
    return mp.CLEAN
  end
  if l_0_1 == "SharpExchangeKing.exe" and l_0_2 == "ExchangeKing" then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

