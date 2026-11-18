-- Threat: !InfrastructureShared
-- Name: 4ab35be5ec59
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
end
if l_0_0 == nil then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
local l_0_1 = "PossibleDllHijackExecFlowRenameA"
local l_0_2 = MpCommon.QueryPersistContext(l_0_0, l_0_1)
if not l_0_2 then
  MpCommon.AppendPersistContext(l_0_0, l_0_1, 600)
  mp.TriggerScanResource("file", l_0_0, 0)
end
return mp.INFECTED
