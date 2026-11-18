-- Threat: !InfrastructureShared
-- Name: 83b34887067b
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(bm.get_imagepath())
if string.find(l_0_1, "\\vcredist_x64.exe", 1, true) or string.find(l_0_1, "\\vcredist_x86.exe", 1, true) then
  return mp.CLEAN
end
local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if sysio.IsFileExists(l_0_4) then
    bm.add_related_file(l_0_4)
  end
end
return mp.INFECTED
