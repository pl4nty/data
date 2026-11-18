-- Threat: !InfrastructureShared
-- Name: 216b3dd3a5aa4
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if this_sigattrlog[6].matched then
  l_0_1 = this_sigattrlog[6].utf8p2
end
local l_0_2, l_0_3 = bm.get_process_relationships()
if l_0_2 then
  for l_0_4, l_0_5 in ipairs(l_0_2) do
    if l_0_5.image_path and mp.bitand(l_0_5.reason_ex, 1) == 1 and string.find(l_0_5.image_path, "\\explorer.exe", 1, true) then
      local l_0_6
      if l_0_0 then
        l_0_6 = mp.GetExecutablesFromCommandLine(l_0_0)
        if l_0_6 then
          for l_0_7, l_0_8 in ipairs(l_0_6) do
            l_0_8 = mp.ContextualExpandEnvironmentVariables(l_0_8)
            if sysio.IsFileExists(l_0_8) then
              bm.add_related_file(l_0_8)
            end
          end
        end
      end
      if l_0_1 then
        l_0_6 = mp.GetExecutablesFromCommandLine(l_0_1)
        if l_0_6 then
          for l_0_9, l_0_10 in ipairs(l_0_6) do
            l_0_10 = mp.ContextualExpandEnvironmentVariables(l_0_10)
            if sysio.IsFileExists(l_0_10) then
              bm.add_related_file(l_0_10)
            end
          end
        end
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
