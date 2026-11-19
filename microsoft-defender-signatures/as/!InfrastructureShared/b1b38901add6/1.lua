-- Threat: !InfrastructureShared
-- Name: b1b38901add6
-- Type: 21

local l_0_0, l_0_1, l_0_2
if not this_sigattrlog[3].matched or this_sigattrlog[3].utf8p1 == nil or this_sigattrlog[3].utf8p1 == "" then
  return mp.CLEAN
end
if not this_sigattrlog[4].matched or this_sigattrlog[4].utf8p2 == nil or this_sigattrlog[4].utf8p2 == "" then
  return mp.CLEAN
end
l_0_0 = this_sigattrlog[3].utf8p1
l_0_1 = this_sigattrlog[4].utf8p2
l_0_2 = string.match(l_0_0, "[^/]+%.sh$")
if l_0_2 == nil then
  return mp.CLEAN
end
if string.find(l_0_1, l_0_2) then
  if sysio.IsFileExists(l_0_0) then
    bm.add_threat_file(l_0_0)
  end
  return mp.INFECTED
end
return mp.CLEAN
