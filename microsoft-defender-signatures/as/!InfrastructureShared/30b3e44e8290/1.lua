-- Threat: !InfrastructureShared
-- Name: 30b3e44e8290
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  ["isxagent.exe"] = true,
  ["totalrecoveryprosetup.exe"] = true
}
local l_0_2 = string.lower(l_0_0:match("\\([^\\]+)$"))
if l_0_1[l_0_2] then
  return mp.CLEAN
end
return mp.INFECTED
