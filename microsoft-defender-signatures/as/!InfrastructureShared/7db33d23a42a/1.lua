-- Threat: !InfrastructureShared
-- Name: 7db33d23a42a
-- Type: 21
-- Includes: TechniqueTracker

if not (this_sigattrlog[3].matched and this_sigattrlog[2].matched) or this_sigattrlog[3].utf8p1 == nil or this_sigattrlog[3].utf8p1 == "" or this_sigattrlog[2].utf8p2 == nil or this_sigattrlog[2].utf8p2 == "" then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[2].utf8p2
local l_0_1 = this_sigattrlog[3].utf8p1
local l_0_2 = l_0_1:match("[^/]*$")
if l_0_2 == nil or not string.find(l_0_0, l_0_2) then
  return mp.CLEAN
end
bm.trigger_sig("BM_MacCurlFileDownload", l_0_1)
TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer_CurlHttp")
return mp.INFECTED
