-- Threat: !InfrastructureShared
-- Name: 1cbd78cb6cdd5
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "wmiprvse.exe" or l_0_1:match("([^\\]+)$") == "explorer.exe" or l_0_1:match("([^\\]+)$") == "mmc.exe" then
    if versioning.IsSeville() or versioning.IsServer() then
      local l_0_2 = versioning.GetOrgID()
      if l_0_2 ~= nil then
        l_0_2 = string.lower(l_0_2)
        local l_0_3 = {
          ["d542d020-ab72-4d56-b7b6-b9f1e998a75a"] = true,
          ["2135e9fa-2274-4c30-a08d-e47c01dda1ec"] = true,
          ["3dc7d3ea-10d3-4100-987a-21d7cccef59b"] = true,
          ["da2e8dd2-f9f1-41c7-834e-e583826af44d"] = true
        }
        if l_0_3[l_0_2] then
          return mp.LOWFI
        end
      end
      return mp.INFECTED
    end
    return mp.LOWFI
  end
end
return mp.CLEAN
