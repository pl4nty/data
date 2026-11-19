-- Threat: !InfrastructureShared
-- Name: !#ALF:Backdoor:Win32/SuspSPAccess
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & MpIsSharePointAmsiScan & SCPT:SuspSharepointAccess.A

local l_0_0, l_0_1
l_0_0 = tostring(headerpage)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_0:match("([^:]+:)")
if not l_0_2 then
  return mp.CLEAN
end
if not (#l_0_2 < #l_0_0) then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
l_0_1 = l_0_2:match("post(/.*.aspx)")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_3 = "SuspSPAccess"
local l_0_4 = 3600
local l_0_5 = 10
AppendToRollingQueue(l_0_3, l_0_1, 1, l_0_4, l_0_5)
return mp.INFECTED
