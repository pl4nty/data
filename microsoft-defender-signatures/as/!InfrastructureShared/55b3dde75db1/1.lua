-- Threat: !InfrastructureShared
-- Name: 55b3dde75db1
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
local l_0_1
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[4].utf8p1
end
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if l_0_4:len() > 6 and MpCommon.QueryPersistContext(l_0_4, "IOAVHasDiscordUrl") then
    bm.add_related_file(l_0_4)
    if not MpCommon.QueryPersistContext(l_0_1, "LargePEInArchiveFromDiscord") then
      MpCommon.AppendPersistContext(l_0_1, "LargePEInArchiveFromDiscord", 3600)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
