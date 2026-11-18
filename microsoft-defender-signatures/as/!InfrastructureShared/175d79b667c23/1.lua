-- Threat: !InfrastructureShared
-- Name: 175d79b667c23
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["iexplore.exe"] = true,
    ["edge.exe"] = true,
    ["msedge.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.INFECTED
  end
end
return mp.CLEAN
