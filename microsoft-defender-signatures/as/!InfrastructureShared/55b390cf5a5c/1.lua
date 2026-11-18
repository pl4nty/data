-- Threat: !InfrastructureShared
-- Name: 55b390cf5a5c
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].ppid
  l_0_1 = this_sigattrlog[3].image_path
end
if l_0_0 ~= nil and l_0_1 ~= nil then
  TrackPidAndTechniqueBM(l_0_0, "T1110.001", "CredentialAccess_FtpBruteForceOutgoing")
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 ~= nil and l_0_2.image_path ~= nil and not string.find(l_0_2.image_path, "/usr/sbin/sshd", -14, true) then
  local l_0_3 = "CredentialAccess_FtpBruteForceOutgoing"
  if l_0_2.image_path == l_0_1 then
    local l_0_4 = mp.GetParentProcInfo(l_0_2.ppid)
    if l_0_4 ~= nil then
      TrackPidAndTechniqueBM(l_0_4.ppid, "T1110.001", l_0_3)
    end
  end
  TrackPidAndTechniqueBM(l_0_2.ppid, "T1110.001", l_0_3)
end
return mp.INFECTED
