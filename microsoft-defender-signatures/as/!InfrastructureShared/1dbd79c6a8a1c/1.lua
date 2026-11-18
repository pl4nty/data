-- Threat: !InfrastructureShared
-- Name: 1dbd79c6a8a1c
-- Type: 21

local l_0_0 = {
  ["winword.exe"] = true,
  ["excel.exe"] = true,
  ["powerpnt.exe"] = true,
  ["outlook.exe"] = true,
  ["iexplore.exe"] = true,
  ["microsoftedge.exe"] = true,
  ["chrome.exe"] = true,
  ["firefox.exe"] = true
}
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 ~= nil then
  local l_0_2 = string.lower(l_0_1.image_path)
  local l_0_3 = string.match(l_0_2, "\\([^\\]+)$")
  if l_0_3 == "" or l_0_3 == nil then
    return mp.CLEAN
  end
  if l_0_0[l_0_3] == true then
    return mp.INFECTED
  end
end
return mp.CLEAN
