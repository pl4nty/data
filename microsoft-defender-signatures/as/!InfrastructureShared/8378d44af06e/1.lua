-- Threat: !InfrastructureShared
-- Name: 8378d44af06e
-- Type: 21

local l_0_0 = mp.getfilesize()
if 3000000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = pe.get_versioninfo()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {
  ["cscui.dll"] = 1,
  ["prnfldr dll"] = 1
}
if not l_0_2[l_0_1.OriginalFilename] then
  return mp.CLEAN
end
return mp.INFECTED
