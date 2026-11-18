-- Threat: !InfrastructureShared
-- Name: 2db375d4c73e
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if string.sub(l_0_0, -4) == ".php" and string.sub(l_0_0, 0, 9) == "/var/www/" then
  if sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
  end
  TrackPidAndTechniqueBM("BM", "T1505.003", "Persistence_Webshell")
  return mp.INFECTED
end
return mp.CLEAN
