-- Threat: !InfrastructureShared
-- Name: !#Lua:ObfusJsVbs.AA
-- Type: 13
-- MpAttributes: Lua:JsObfus.B

local l_0_0 = mp.getfilesize()
if l_0_0 <= 300 or 400000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.getfilename())
if l_0_1 == nil or l_0_1:match("%->.+/") or l_0_1:match("%->.-\\") then
  return mp.CLEAN
end
return mp.INFECTED
