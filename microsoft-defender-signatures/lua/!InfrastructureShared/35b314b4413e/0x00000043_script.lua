-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\35b314b4413e\0x00000043_luac 

-- params : ...
-- function num : 0
local l_0_0 = (GetRollingQueue("big_reg_write"))
local l_0_1, l_0_2 = nil, nil
if (this_sigattrlog[1]).matched then
  l_0_1 = (this_sigattrlog[1]).utf8p2
  l_0_2 = (this_sigattrlog[1]).utf8p1
end
if l_0_0 ~= nil then
  for l_0_6 in pairs(l_0_0) do
    if l_0_2 then
      l_0_2 = (string.lower)(l_0_2)
      if (string.find)(l_0_2, tostring((l_0_0[l_0_6]).key)) and #l_0_1 >= 1000 then
        return mp.INFECTED
      end
    end
  end
end
do
  return mp.CLEAN
end

