-- Threat: !InfrastructureShared
-- Name: 32b3f24768a6
-- Type: 21
-- Includes: TechniqueTracker

function propagateTTParent(l_1_0, l_1_1, l_1_2)
  local l_1_3 = mp.GetParentProcInfo(l_1_0)
  
  if l_1_3 == nil then
    return
  end
  l_1_0 = l_1_3.ppid
  if l_1_0 == nil then
    return
  end
  TrackPidAndTechniqueBM(l_1_0, l_1_1, l_1_2)
  return
end

function isProcessExcluded(l_2_0, l_2_1)
  local l_2_2 = {
    {
      "/bin/python",
      " -u bin/WALinuxAgent"
    },
    {
      "",
      "/opt/microsoft/omsagent/bin/omsadmin.sh"
    }
  }
  for l_2_3, l_2_4 in ipairs(l_2_2) do
    local l_2_5 = l_2_4[1]
    local l_2_6 = l_2_4[2]
    if string.find(l_2_0, l_2_5, 1, true) and string.find(l_2_1, l_2_6, 1, true) then
      return true
    end
  end
  return false
end

local l_0_0, l_0_1, l_0_2, l_0_3
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
  l_0_1 = this_sigattrlog[1].utf8p2
  l_0_2 = this_sigattrlog[1].ppid
  l_0_3 = this_sigattrlog[1].image_path
end
local l_0_4 = mp.GetProcessCommandLine(l_0_2)
if not (l_0_0 and l_0_1 and l_0_2 and l_0_3) or not l_0_4 then
  return mp.CLEAN
end
if not string.match(l_0_0, "T%d%d%d%d") or l_0_1 == "INFECTED" then
  return mp.CLEAN
end
if isProcessExcluded(l_0_3, l_0_4) then
  return mp.CLEAN
end
local l_0_5 = {
  "Execution_SuspiciousProcessLaunch",
  "Execution_SuspiciousCommandline"
}
for l_0_6, l_0_7 in ipairs(l_0_5) do
  if l_0_1 == l_0_7 then
    return mp.CLEAN
  end
end
local l_0_8 = IsDetectionThresholdMetLinux(l_0_2)
if l_0_8 then
  bm.trigger_sig("SuspiciousTTRel", "Detected")
  return mp.CLEAN
end
propagateTTParent(l_0_2, l_0_0, l_0_1)
return mp.CLEAN
