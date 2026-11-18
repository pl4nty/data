-- Threat: !InfrastructureShared
-- Name: b1b30e43871c
-- Type: 21

if bm.GetSignatureMatchDuration() > 100000000 then
  return mp.CLEAN
end
local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if string.find(string.lower(l_0_3.image_path), "\\rundll32.exe", 1, true) then
    MpCommon.TurnNriOnProcess(l_0_3.ppid)
    bm.request_SMS(l_0_3.ppid, "M")
    local l_0_4, l_0_5 = string.match(l_0_3.ppid, "^pid:(%w+),ProcessStart:(%w+)$")
    local l_0_6 = tonumber(l_0_4)
    local l_0_7 = tonumber(l_0_5)
    local l_0_8, l_0_9 = mp.bsplit(l_0_7, 32)
    local l_0_10 = string.format("ppids:{{%d,%d,%d}}\000", l_0_6, l_0_8, l_0_9)
    mp.TriggerScanResource("ems", l_0_10, mp.SCANSOURCE_RTSIG, 5000)
    return mp.INFECTED
  end
end
return mp.CLEAN
