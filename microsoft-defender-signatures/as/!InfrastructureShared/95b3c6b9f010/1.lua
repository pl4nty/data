-- Threat: !InfrastructureShared
-- Name: 95b3c6b9f010
-- Type: 21

local l_0_0
if not this_sigattrlog[2].matched or this_sigattrlog[2].utf8p2 == nil or this_sigattrlog[2].utf8p2 == "" then
  return mp.CLEAN
end
l_0_0 = string.match(this_sigattrlog[2].utf8p2, "/tmp/[^/]+/[^/]+.sh$")
if l_0_0 then
  if sysio.IsFileExists(l_0_0) then
    bm.add_threat_file(l_0_0)
  end
  return mp.INFECTED
end
return mp.CLEAN
