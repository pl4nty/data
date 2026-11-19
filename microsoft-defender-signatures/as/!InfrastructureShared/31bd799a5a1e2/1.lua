-- Threat: !InfrastructureShared
-- Name: 31bd799a5a1e2
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if string.find(l_0_1, "regbackup3", 2, true) or string.find(l_0_1, ":\\Program Files\\Sangfor\\UES\\agent\\bin\\python\\wkpd_check_app.exe", 2, false) or string.find(l_0_1, "\\windows defender advanced threat protection\\senseir.exe", 1, true) then
    return mp.CLEAN
  end
end
if IsProcNameInParentProcessTree("cmdhstr", "senseir.exe") then
  return mp.CLEAN
end
return mp.INFECTED
