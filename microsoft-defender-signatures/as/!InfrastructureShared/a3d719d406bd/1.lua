-- Threat: !InfrastructureShared
-- Name: a3d719d406bd
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "services.exe" or l_0_1:match("([^\\]+)$") == "wmiprvse.exe" then
    if versioning.IsSeville() or versioning.IsServer() then
      local l_0_2 = versioning.GetOrgID()
      if l_0_2 ~= nil then
        l_0_2 = string.lower(l_0_2)
        local l_0_3 = {
          ["d40e70ae-4b88-4c7e-944d-68c92494028c"] = true
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
