-- Threat: !InfrastructureShared
-- Name: !#Lua:ZeroPlusAmsiTrigger.A
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: MpIsPowerShellAMSIScan

local l_0_0 = mp.enum_mpattributesubstring("SCRIPT:Ps")
local l_0_1 = mp.enum_mpattributesubstring("SCRIPT:PowerShell")
local l_0_2 = mp.enum_mpattributesubstring("SCPT:ps")
local l_0_3 = mp.enum_mpattributesubstring("SCPT:PowerShell")
if isnull(l_0_0) and isnull(l_0_1) and isnull(l_0_2) and isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = #l_0_0 + #l_0_1 + #l_0_2 + #l_0_3
if 10 <= l_0_4 then
  return mp.INFECTED
end
return mp.CLEAN
