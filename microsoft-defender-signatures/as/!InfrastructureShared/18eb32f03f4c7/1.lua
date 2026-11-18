-- Threat: !InfrastructureShared
-- Name: 18eb32f03f4c7
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  local l_0_1 = {
    ["wmiprvse.exe"] = true,
    ["csrss.exe"] = true,
    ["svchost.exe"] = true,
    ["gamemon64.des"] = true,
    ["wsqmcons.exe"] = true,
    ["lsadetsetup.exe"] = true
  }
  local l_0_2 = string.lower(string.sub(l_0_0, -15)):match("\\([^\\]+)$")
  if l_0_1[l_0_2] then
    return mp.CLEAN
  end
end
return mp.INFECTED
