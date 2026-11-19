-- Threat: !InfrastructureShared
-- Name: 8bb3738b4c2f
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if string.find(string.lower(l_0_3.image_path), "\\powershell.exe", 1, true) then
    MpCommon.TurnNriOnProcess(l_0_3.ppid)
    local l_0_4, l_0_5 = string.match(l_0_3.ppid, "^pid:(%w+),ProcessStart:(%w+)$")
    local l_0_6 = tonumber(l_0_4)
    local l_0_7 = tonumber(l_0_5)
    local l_0_8, l_0_9 = mp.bsplit(l_0_7, 32)
    local l_0_10 = string.format("ppids:{{%d,%d,%d}}\000", l_0_6, l_0_8, l_0_9)
    mp.TriggerScanResource("ems", l_0_10)
  end
end
return mp.INFECTED
