-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a4b0_584.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 == nil or #l_0_0 < 1 then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
local l_0_1 = nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
  l_0_1 = (this_sigattrlog[1]).utf8p1
end
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if (string.sub)(l_0_0, -#l_0_1) ~= l_0_1 then
  return mp.CLEAN
end
do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
    local l_0_2 = (this_sigattrlog[2]).utf8p2
    if (sysio.IsFileExists)(l_0_2) then
      (bm.add_related_file)(l_0_2)
    end
  end
  return mp.INFECTED
end

