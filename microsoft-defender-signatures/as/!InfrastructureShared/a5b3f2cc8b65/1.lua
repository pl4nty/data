-- Threat: !InfrastructureShared
-- Name: a5b3f2cc8b65
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
local l_0_2
if this_sigattrlog[5].matched then
  l_0_2 = this_sigattrlog[5].image_path
elseif this_sigattrlog[6].matched then
  l_0_2 = this_sigattrlog[6].image_path
end
if l_0_2 ~= nil then
  for l_0_3, l_0_4 in ipairs(l_0_1) do
    if l_0_4.image_path == l_0_2 then
      local l_0_5, l_0_6 = string.match(l_0_4.ppid, "pid:(%w+),ProcessStart:(%w+)")
      local l_0_7 = tonumber(l_0_5)
      local l_0_8 = tonumber(l_0_6)
      local l_0_9, l_0_10 = mp.bsplit(l_0_8, 32)
      local l_0_11 = string.format("ppids:{{%d,%d,%d}}\000", l_0_7, l_0_9, l_0_10)
      mp.TriggerScanResource("ems", l_0_11)
    end
  end
end
return mp.INFECTED
