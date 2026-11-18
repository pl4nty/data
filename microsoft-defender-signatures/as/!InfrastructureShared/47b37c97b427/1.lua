-- Threat: !InfrastructureShared
-- Name: 47b37c97b427
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  local l_0_2, l_0_3 = bm.get_process_relationships()
  for l_0_4, l_0_5 in ipairs(l_0_1) do
    if sysio.IsFileExists(l_0_5) then
      bm.add_related_file(l_0_5)
    end
  end
  for l_0_6, l_0_7 in ipairs(l_0_2) do
    bm.add_related_file(l_0_7.image_path)
  end
end
return mp.INFECTED
