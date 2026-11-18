-- Threat: !InfrastructureShared
-- Name: b5d7ddc9c99d
-- Type: 21
-- Includes: TechniqueTracker

if IsPidExcluded("CMDHSTR") then
  return mp.CLEAN
end
local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:find("\\colortokens\\\\lgm\\ct-lgm.exe", 1, true) or l_0_1:find("pmcsecuritysettool.exe$") or l_0_1:find("\\windows\\ccm\\tsmanager.exe", 1, true) or l_0_1:find("\\windows\\ccm\\smsswd.exe", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
