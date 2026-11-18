-- Threat: !InfrastructureShared
-- Name: e3d73691bd12
-- Type: 21
-- Includes: ResearchData

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  set_research_data("ParentProcess", string.gsub(l_0_0.ppid, ",", ":") .. ";" .. l_0_0.image_path, false)
end
return mp.INFECTED
