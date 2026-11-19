-- Threat: !InfrastructureShared
-- Name: 15b367fe3d15
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  local l_0_1 = {
    ["chrome.exe"] = true,
    ["svchost.exe"] = true,
    ["wmiprvse.exe"] = true,
    ["msiexec.exe"] = true,
    ["syntpenh.exe"] = true
  }
  local l_0_2 = string.lower(string.sub(l_0_0, -15)):match("\\([^\\]+%.exe)$")
  if l_0_1[l_0_2] then
    return mp.CLEAN
  end
end
return mp.INFECTED
