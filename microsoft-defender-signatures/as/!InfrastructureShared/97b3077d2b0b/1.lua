-- Threat: !InfrastructureShared
-- Name: 97b3077d2b0b
-- Type: 21

local l_0_0 = this_sigattrlog[1].matched and this_sigattrlog[1] or this_sigattrlog[2]
if not l_0_0.utf8p2 then
  return mp.CLEAN
end
local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0.utf8p2)
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if string.lower(l_0_3) ~= string.lower(l_0_0.image_path) and sysio.IsFileExists(l_0_3) and 18 <= #l_0_3 and (string.sub(l_0_3, -18) == ".devicemanifest-ms" or string.sub(l_0_3, -18) == ".devicemetadata-ms") then
    bm.add_threat_file(l_0_3)
  end
end
return mp.INFECTED
