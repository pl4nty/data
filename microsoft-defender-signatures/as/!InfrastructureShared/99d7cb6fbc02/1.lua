-- Threat: !InfrastructureShared
-- Name: 99d7cb6fbc02
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = l_0_0.image_path:lower()
local l_0_2 = l_0_1:match("\\([^\\]+)$")
local l_0_3 = {
  ["powershell.exe"] = true,
  ["aspnet_compiler.exe"] = true,
  ["iisexpress.exe"] = true
}
if l_0_3[l_0_2] then
  return mp.CLEAN
end
return mp.LOWFI
