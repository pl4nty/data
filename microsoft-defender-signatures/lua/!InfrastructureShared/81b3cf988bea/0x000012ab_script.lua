-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\81b3cf988bea\0x000012ab_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  local l_0_0 = (string.lower)((this_sigattrlog[1]).utf8p2)
  local l_0_1 = "System.IO.MemoryStream"
  if (string.find)(l_0_0, l_0_1) then
    return mp.INFECTED
  end
  return mp.CLEAN
end
do
  return mp.CLEAN
end

