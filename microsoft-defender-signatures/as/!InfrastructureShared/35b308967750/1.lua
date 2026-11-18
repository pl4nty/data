-- Threat: !InfrastructureShared
-- Name: 35b308967750
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
local l_0_2 = 0
if l_0_0 ~= nil then
  for l_0_3, l_0_4 in ipairs(l_0_0) do
    if l_0_4.image_path ~= nil then
      local l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_4.image_path)
      if sysio.IsFileExists(l_0_5) then
        bm.add_related_file(l_0_5)
        l_0_2 = l_0_2 + 1
        if 2 < l_0_2 then
          break
        end
      end
    end
  end
end
return mp.INFECTED
