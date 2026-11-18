-- Threat: !InfrastructureShared
-- Name: !#Lua:ThreatsOnMachineRQ
-- Type: 28
-- Includes: LuaFuncHelper

local l_0_0 = 10800
local l_0_1 = 10
local l_0_2 = mp.enum_mpattributesubstring("Detection:HackTool:")
if 0 < #l_0_2 then
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    AppendToRollingQueue("ThreatsOnMachine_Lua", l_0_4, 1, l_0_0, l_0_1)
  end
end
l_0_2 = mp.enum_mpattributesubstring("Detection:Trojan:")
if 0 < #l_0_2 then
  for l_0_5, l_0_6 in ipairs(l_0_2) do
    AppendToRollingQueue("ThreatsOnMachine_Lua", l_0_6, 1, l_0_0, l_0_1)
  end
end
l_0_2 = mp.enum_mpattributesubstring("Detection:")
if 0 < #l_0_2 then
  for l_0_7, l_0_8 in ipairs(l_0_2) do
    AppendToRollingQueue("RecentThreatsOnMachine", l_0_8, 5, 1800, 100)
  end
end
return mp.CLEAN
