-- Threat: !InfrastructureShared
-- Name: 2db35a50a7af
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = GetRollingQueue("big_reg_write")
local l_0_1, l_0_2
if this_sigattrlog[1].matched then
  l_0_1 = this_sigattrlog[1].utf8p2
  l_0_2 = this_sigattrlog[1].utf8p1
end
if l_0_0 ~= nil then
  for l_0_3 in pairs(l_0_0) do
    if l_0_2 then
      l_0_2 = string.lower(l_0_2)
      if string.find(l_0_2, tostring(l_0_0[l_0_3].key)) and 20 <= #l_0_1 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
