-- Threat: !InfrastructureShared
-- Name: 9fb316239107
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 == nil or #l_0_0 <= 0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
local l_0_2 = false
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if string.find(l_0_4, "\\program files", 1, true) == nil and sysio.IsFileExists(l_0_4) and MpCommon.QueryPersistContext(l_0_4, "RemoteAccessTool") then
    bm.add_threat_file(l_0_4)
    l_0_2 = true
  end
end
if l_0_2 == false then
  return mp.CLEAN
end
return mp.INFECTED
