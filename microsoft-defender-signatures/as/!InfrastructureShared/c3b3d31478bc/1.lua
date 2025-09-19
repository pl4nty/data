-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c3b3d31478bc\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil and (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  local l_0_0 = (string.lower)((this_sigattrlog[1]).utf8p2)
  local l_0_1 = (string.lower)((this_sigattrlog[2]).utf8p2)
  local l_0_2 = (string.match)(l_0_0, "([^\\]+%.exe)")
  if contains(l_0_2, l_0_1) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

