-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15d0b0b22861\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "󠁴󠁨\144\000"
if not (mp.get_mpattribute)("Lua:FileExtensionAttr!md") and not (mp.get_mpattribute)("Lua:FileExtensionAttr!mdc") then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("LUA:FileSizeLE10M.B") then
  return mp.CLEAN
end
local l_0_1 = CollectXpiaBruteTelemetry(l_0_0)
if l_0_1 == nil then
  return mp.INFECTED
end
set_research_data("EncodedBytes", l_0_1, false)
return mp.INFECTED

