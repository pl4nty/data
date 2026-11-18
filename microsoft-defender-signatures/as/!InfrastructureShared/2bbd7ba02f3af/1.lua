-- Threat: !InfrastructureShared
-- Name: 2bbd7ba02f3af
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["explorer.exe"] = true,
    ["powershell.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.INFECTED
  end
end
return mp.CLEAN
