-- Threat: !InfrastructureShared
-- Name: ccb3476b55ae
-- Type: 21
-- Includes: TechniqueTracker

if bm.GetSignatureMatchDuration() > 20000000 then
  return mp.CLEAN
end
local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if mp.bitand(l_0_3.reason_ex, 1) == 1 and l_0_3.image_path ~= nil and l_0_3.ppid ~= nil and string.find(string.lower(l_0_3.image_path), "\\svchost.exe", -12, true) then
    local l_0_4 = mp.GetProcessCommandLine(l_0_3.ppid)
    if string.find(l_0_4, "localService -p -s RemoteRegistry", 1, true) then
      AddTacticForPid(l_0_3.ppid, "remoteregistry")
    end
  end
end
return mp.INFECTED
