-- Threat: !InfrastructureShared
-- Name: 329b3962e29a4
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
local l_0_1 = 2
local l_0_2
local l_0_3 = 30
local l_0_4 = 5
local l_0_5, l_0_6
local l_0_7 = "rqsecuritysoftwaredisc"
if this_sigattrlog[1].matched then
  l_0_2 = "mdatp"
elseif this_sigattrlog[2].matched then
  l_0_2 = "firewall"
elseif this_sigattrlog[3].matched then
  l_0_2 = "littlesnitch"
elseif this_sigattrlog[4].matched then
  l_0_2 = "opensnitch"
elseif this_sigattrlog[5].matched then
  l_0_2 = "avast"
elseif this_sigattrlog[6].matched then
  l_0_2 = "avira"
elseif this_sigattrlog[7].matched then
  l_0_2 = "mcafee"
elseif this_sigattrlog[8].matched then
  l_0_2 = "webprotection"
elseif this_sigattrlog[9].matched then
  l_0_2 = "isecespd"
elseif this_sigattrlog[10].matched then
  l_0_2 = "macmnsvc"
elseif this_sigattrlog[12].matched then
  l_0_2 = "avscan"
elseif this_sigattrlog[13].matched then
  l_0_2 = "rtvscand"
elseif this_sigattrlog[14].matched then
  l_0_2 = "symcfgd"
elseif this_sigattrlog[15].matched then
  l_0_2 = "scmdaemon"
elseif this_sigattrlog[16].matched then
  l_0_2 = "symantec"
elseif this_sigattrlog[17].matched then
  l_0_2 = "osquery"
elseif this_sigattrlog[18].matched then
  l_0_2 = "sophos"
elseif this_sigattrlog[19].matched then
  l_0_2 = "elastic"
end
l_0_5, l_0_6 = pcall(MpCommon.RollingQueueCreate, l_0_7, l_0_4, l_0_3, 1)
if not l_0_5 then
  return mp.CLEAN
end
l_0_5, l_0_6 = pcall(MpCommon.RollingQueueAppend, l_0_7, l_0_2, "", l_0_3)
if not l_0_5 then
  return mp.CLEAN
end
l_0_5, l_0_6 = pcall(MpCommon.RollingQueueCount, l_0_7)
if not l_0_5 then
  return mp.CLEAN
end
l_0_0 = l_0_6
if l_0_1 < l_0_0 then
  TrackPidAndTechniqueBM("BM", "T1518.001", "SecuritySoftwareDiscovery")
  return mp.INFECTED
end
return mp.CLEAN
