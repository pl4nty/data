-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00001c7f_luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[2]).matched and (this_sigattrlog[3]).matched and (this_sigattrlog[1]).utf8p1 ~= nil and (this_sigattrlog[1]).utf8p1 ~= "" then
    local l_0_0 = (this_sigattrlog[1]).utf8p1
    if (string.find)((this_sigattrlog[2]).utf8p2, l_0_0, 1, true) and (string.find)((this_sigattrlog[3]).utf8p2, l_0_0, 1, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

