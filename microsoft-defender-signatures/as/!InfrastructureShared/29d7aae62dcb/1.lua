-- Threat: !InfrastructureShared
-- Name: 29d7aae62dcb
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = string.sub(l_0_1, -15):match("\\([^\\]+)$")
  local l_0_3 = {
    ["svchost.exe"] = true,
    ["taskeng.exe"] = true,
    ["taskhostw.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.INFECTED
  end
end
return mp.CLEAN
