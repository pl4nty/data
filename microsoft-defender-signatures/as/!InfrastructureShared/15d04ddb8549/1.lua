-- Threat: !InfrastructureShared
-- Name: 15d04ddb8549
-- Type: 21
-- Includes: ResearchData, LuaFuncHelper

local l_0_0 = "\243\160\129\165\243\160\129\142\144\000"
if not mp.get_mpattribute("Lua:FileExtensionAttr!md") and not mp.get_mpattribute("Lua:FileExtensionAttr!mdc") then
  return mp.CLEAN
end
if not mp.get_mpattribute("LUA:FileSizeLE10M.B") then
  return mp.CLEAN
end
local l_0_1 = CollectXpiaBruteTelemetry(l_0_0)
if l_0_1 == nil then
  return mp.INFECTED
end
set_research_data("EncodedBytes", l_0_1, false)
return mp.INFECTED
