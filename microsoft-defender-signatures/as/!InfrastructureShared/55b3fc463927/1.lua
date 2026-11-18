-- Threat: !InfrastructureShared
-- Name: 55b3fc463927
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = {
  {
    "python",
    "/var/lib/waagent"
  },
  {
    "/lib/systemd/systemd",
    "/lib/systemd/systemd"
  },
  {
    "sapstartsrv",
    "/usr/sap/"
  }
}
local l_0_1 = "remote_file_created_taint"
local l_0_2, l_0_3, l_0_4
if this_sigattrlog[3].matched then
  l_0_2 = this_sigattrlog[3].ppid
  l_0_3 = this_sigattrlog[3].image_path
  l_0_4 = this_sigattrlog[3].utf8p2
end
local l_0_5 = mp.GetParentProcInfo()
if l_0_3 ~= nil and l_0_5 ~= nil and l_0_5.image_path ~= nil and not isTainted(l_0_5.image_path, l_0_1) and not isTainted(l_0_3, l_0_1) then
  return mp.CLEAN
end
if l_0_3 ~= nil and l_0_4 ~= nil then
  for l_0_6, l_0_7 in ipairs(l_0_0) do
    local l_0_8 = l_0_7[1]
    local l_0_9 = l_0_7[2]
    if string.find(l_0_3, l_0_8, 1, true) and string.find(l_0_4, l_0_9, 1, true) then
      return mp.CLEAN
    end
  end
end
if l_0_2 ~= nil and not isParentPackageManager(l_0_2, true) and not checkParentCmdline(l_0_2, l_0_0, 2) and versioning.GetCloudBlockLevel() >= 4 then
  TrackPidAndTechniqueBM(l_0_2, "T1543.002", "Persistence")
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
