-- Threat: !InfrastructureShared
-- Name: 3d6b3b360fb77
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[17].matched then
  l_0_0 = string.lower(this_sigattrlog[17].utf8p2)
elseif this_sigattrlog[18].matched then
  l_0_0 = string.lower(this_sigattrlog[18].utf8p2)
end
if l_0_0 ~= nil and (string.find(l_0_0, "https://dev.azure.com", 1, true) or string.find(l_0_0, "https://portalpre.inmocaixa.com", 1, true) or string.find(l_0_0, "https://www.nfbio.dk", 1, true) or string.find(l_0_0, "https://lsp.accenture.com", 1, true) or string.find(l_0_0, "mgpprx.mgg.local", 1, true) or string.find(l_0_0, "/usr/bin/containerd-shim-runc-v2", 1, true) or string.find(l_0_0, "hooks.slack.com", 1, true) or string.find(l_0_0, "https://gdconf.com", 1, true) or string.find(l_0_0, ".emirates.com", 1, true) or string.find(l_0_0, " -xe /tmp/jenkins", 1, true) or string.find(l_0_0, "/sbiptvappprd01/CMS/plugin/_Dashboard", 1, true) or string.find(l_0_0, "taylorfrancis.com/", 1, true) or string.find(l_0_0, "curl -k -u elastic:", 1, true) or string.find(l_0_0, "https://blackhateurope.informatech.com/", 1, true) or string.find(l_0_0, "https://blackhat.informafestivals.com/", 1, true) or string.find(l_0_0, "https://bitbucket.tav.aero", 1, true) or string.find(l_0_0, "rs-arh.global.mgroot.net", 1, true)) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1505.003", "Persistence_Webshell")
return mp.INFECTED
