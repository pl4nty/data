-- Threat: !InfrastructureShared
-- Name: 7db3421784a0
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = "webservice_childproc"
elseif this_sigattrlog[2].matched then
  l_0_0 = "webserver_childproc"
elseif this_sigattrlog[3].matched then
  l_0_0 = "dbservice_childproc"
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = bm.get_process_relationships()
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if mp.bitand(l_0_4.reason_ex, 1) == 1 then
    TrackPidAndTechniqueBM(l_0_4.ppid, "T1190", l_0_0, 7200)
  end
end
return mp.CLEAN
