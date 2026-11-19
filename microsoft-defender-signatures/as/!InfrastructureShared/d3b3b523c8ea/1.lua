-- Threat: !InfrastructureShared
-- Name: d3b3b523c8ea
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
elseif this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
elseif this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
elseif this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
elseif this_sigattrlog[5].matched then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p1)
elseif this_sigattrlog[6].matched then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p1)
end
if l_0_0 ~= nil and string.sub(l_0_0, -4) == ".php" then
  if sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
  end
  TrackPidAndTechniqueBM("BM", "T1505.003", "Persistence_Webshell")
  return mp.INFECTED
end
return mp.CLEAN
