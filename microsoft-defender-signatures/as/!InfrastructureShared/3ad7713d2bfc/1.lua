-- Threat: !InfrastructureShared
-- Name: 3ad7713d2bfc
-- Type: 21
-- Includes: AppomalyHelpers

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "sqlservr.exe" then
    local l_0_2 = mp.GetScannedPPID()
    if not l_0_2 then
      return mp.CLEAN
    end
    local l_0_3 = mp.GetProcessCommandLine(l_0_2):lower()
    if hasBase64Content(l_0_3) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
