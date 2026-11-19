-- Threat: !InfrastructureShared
-- Name: 7bb34ec452fe
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil and l_0_0.ppid ~= nil then
  local l_0_1 = string.lower(l_0_0.command_line)
  local l_0_2 = l_0_0.ppid
  if l_0_1:match("\\conhost.exe") then
    TrackPidAndTechniqueBM(l_0_2, "T1202", "indirectcmdexec")
  end
  local l_0_3, l_0_4 = bm.get_process_relationships()
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    TrackPidAndTechniqueBM(l_0_6.ppid, "T1202", "indirectcmdexec")
  end
  return mp.INFECTED
end
return mp.CLEAN
