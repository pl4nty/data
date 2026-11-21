-- Threat: !InfrastructureShared
-- Name: 3fb399927952
-- Type: 21
-- Includes: SocksProcessLearningInfra

local l_0_0 = versioning.GetOrgID()
local l_0_1 = 1
if type(l_0_0) == "string" then
  l_0_0 = l_0_0:lower()
  if l_0_0 == "26e8b179-9fbe-40fd-8f34-37cdee8c4766" or l_0_0 == "e6e2b814-cd64-4ac3-9e16-91753ff30617" or l_0_0 == "bcfa1838-fccc-4999-9d5b-5ec1ac1a4776" then
    l_0_1 = 1000
  end
end
if versioning.IsSampled(l_0_1, false, false, false) ~= true then
  return mp.CLEAN
end
local l_0_2 = this_sigattrlog[1]
if not (l_0_2 and l_0_2.matched) or type(l_0_2.utf8p1) ~= "string" then
  return mp.CLEAN
end
local l_0_3 = l_0_2.utf8p1:lower()
local l_0_4
if l_0_3 == "nri:confirmedsocksclient.a" then
  l_0_4 = "Client"
elseif l_0_3 == "nri:confirmedsocksserver.a" then
  l_0_4 = "Server"
else
  return mp.CLEAN
end
local l_0_5, l_0_6, l_0_7 = Infrastructure_ObserveSocksProcess(l_0_4, bm.get_imagepath())
if l_0_6 then
  bm.add_related_string("SocksProcessLearningStatus", l_0_6, bm.RelatedStringBMReport)
end
if l_0_5 == mp.INFECTED then
  bm.add_related_string("NewSocksProcessPair", l_0_7, bm.RelatedStringBMReport)
  bm.trigger_sig("NewSocksProcessPair", l_0_4)
end
return mp.CLEAN
