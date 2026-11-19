-- Threat: !InfrastructureShared
-- Name: 6f8d7555d14bb
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = {
    ["winword.exe"] = true,
    ["powerpnt.exe"] = true,
    ["excel.exe"] = true
  }
  local l_0_2 = string.lower(l_0_0.image_path:match("([^\\]+)$"))
  if l_0_1[l_0_2] then
    return mp.INFECTED
  end
end
return mp.CLEAN
