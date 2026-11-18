-- Threat: !InfrastructureShared
-- Name: 3fb399927952
-- Type: 21
-- Includes: SocksProcessLearningInfra

local l_0_0 = this_sigattrlog[1]
if not (l_0_0 and l_0_0.matched) or type(l_0_0.utf8p1) ~= "string" then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p1:lower()
local l_0_2
if l_0_1 == "nri:confirmedsocksclient.a" then
  l_0_2 = "Client"
elseif l_0_1 == "nri:confirmedsocksserver.a" then
  l_0_2 = "Server"
else
  return mp.CLEAN
end
local l_0_3, l_0_4, l_0_5 = Infrastructure_ObserveSocksProcess(l_0_2, bm.get_imagepath())
if l_0_4 then
  bm.add_related_string("SocksProcessLearningStatus", l_0_4, bm.RelatedStringBMReport)
end
if l_0_3 == mp.INFECTED then
  bm.add_related_string("NewSocksProcessPair", l_0_5, bm.RelatedStringBMReport)
  bm.trigger_sig("NewSocksProcessPair", l_0_2)
end
return mp.CLEAN
