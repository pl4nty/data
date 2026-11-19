-- Threat: !InfrastructureShared
-- Name: a1d78a074718
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0):lower()
if l_0_1 == nil then
  return mp.CLEAN
end
if string.match(l_0_1, " scrobj.dll") then
  return mp.LOWFI
end
l_0_1 = l_0_1:match("^(.*%S)%s*$")
local l_0_2 = string.match(l_0_1, "i:http.*%s+(.*)$")
l_0_2 = l_0_2 or string.match(l_0_1, "i:ftp.*%s+(.*)$")
local l_0_3, l_0_4 = IsKeyInRollingQueue("scrobj.dll", l_0_2, true)
if l_0_3 then
  return mp.LOWFI
end
local l_0_5 = GetRollingQueue("scrobj.dll")
if l_0_5 ~= nil and type(l_0_5) == "table" then
  for l_0_6 in pairs(l_0_5) do
    if string.find(l_0_1, l_0_5[l_0_6].key) then
      return mp.LOWFI
    end
  end
end
return mp.CLEAN
