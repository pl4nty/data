-- Threat: !InfrastructureShared
-- Name: 83b36526ca2d
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if string.find(l_0_0, "https://", 1, true) then
  TrackPidAndTechniqueBM("BM", "T1048", "Exfiltration_ExfiltrationOverAlternativeProtocol_AsymmetricEncryptedNonC2Protocol")
  bm.trigger_sig("BM_FileUploadOverHTTPSUsingCurl", l_0_0)
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
if string.find(l_0_0, "http://", 1, true) then
  bm.trigger_sig("BM_FileUploadOverHTTPUsingCurl", l_0_0)
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
