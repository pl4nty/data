-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaZeroPlusAmsiTriggerA\0x0000003b_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.enum_mpattributesubstring)("SCRIPT:Ps")
local l_0_1 = (mp.enum_mpattributesubstring)("SCRIPT:PowerShell")
local l_0_2 = (mp.enum_mpattributesubstring)("SCPT:ps")
local l_0_3 = (mp.enum_mpattributesubstring)("SCPT:PowerShell")
if isnull(l_0_0) and isnull(l_0_1) and isnull(l_0_2) and isnull(l_0_3) then
  return mp.CLEAN
end
if #l_0_0 + #l_0_1 + #l_0_2 + #l_0_3 >= 10 then
  return mp.INFECTED
end
return mp.CLEAN

