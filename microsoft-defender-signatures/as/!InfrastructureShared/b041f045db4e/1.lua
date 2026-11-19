-- Threat: !InfrastructureShared
-- Name: b041f045db4e
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if peattributes.ismsil ~= true or peattributes.isdll ~= true or peattributes.hasexports ~= false then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[8].matched and this_sigattrlog[8].p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[8].p1)
end
if contains(l_0_0, "aspnet_regbrowsers") then
  return mp.CLEAN
end
l_0_0 = str_reverse(l_0_0:gsub("[-,.]", ""))
if contains(l_0_0, "aspnet_regbrowsers") then
  return mp.INFECTED
end
return mp.CLEAN
