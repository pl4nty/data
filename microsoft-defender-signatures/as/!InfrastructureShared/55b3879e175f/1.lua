-- Threat: !InfrastructureShared
-- Name: 55b3879e175f
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
end
if l_0_0 ~= nil then
  if string.find(l_0_0, "\\microsoft.net\\framework") ~= nil then
    return mp.CLEAN
  end
  if sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
    bm.add_threat_file(l_0_0)
    return mp.INFECTED
  end
end
return mp.CLEAN
