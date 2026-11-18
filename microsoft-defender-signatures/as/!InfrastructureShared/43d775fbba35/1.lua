-- Threat: !InfrastructureShared
-- Name: 43d775fbba35
-- Type: 21

local l_0_0 = {
  ["winword.exe"] = true,
  ["excel.exe"] = true,
  ["powerpnt.exe"] = true,
  ["outlook.exe"] = true
}
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 ~= nil then
  local l_0_2 = string.lower(l_0_1.image_path)
  local l_0_3 = l_0_2:match("([^\\]+)$")
  if l_0_0[l_0_3] then
    return mp.INFECTED
  end
end
local l_0_4 = mp.GetParentProcInfo(l_0_1.ppid)
if l_0_4 ~= nil then
  local l_0_5 = string.lower(l_0_4.image_path)
  local l_0_6 = string.sub(l_0_5, -15):match("\\([^\\]+)$")
  if l_0_0[l_0_6] then
    return mp.INFECTED
  end
end
return mp.CLEAN
