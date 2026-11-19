-- Threat: !InfrastructureShared
-- Name: 21eb393e526dc
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
if string.find(string.lower(l_0_0), "\\program files", 1, true) or string.find(string.lower(l_0_0), "\\mpsigstub.exe", 1, true) or string.find(string.lower(l_0_0), "\\mpcmdrun.exe", 1, true) then
  return mp.CLEAN
end
if bm.GetSignatureMatchDuration() < 20000000 then
  TrackPidAndTechniqueBM("BM", "T1573.001", "EncryptedTrafficOverHttp")
  return mp.INFECTED
end
return mp.CLEAN
