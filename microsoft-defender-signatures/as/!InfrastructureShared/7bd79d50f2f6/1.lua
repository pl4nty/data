-- Threat: !InfrastructureShared
-- Name: 7bd79d50f2f6
-- Type: 21
-- Includes: TechniqueTracker

if IsPidExcluded("CMDHSTR") then
  return mp.CLEAN
end
local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["appvlp.exe"] = true,
    ["control.exe"] = true,
    ["explorer.exe"] = true,
    ["sihost.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
end
TrackPidAndTechnique("CMDHSTR", "T1218.011", "lolbin_rundll")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.LOWFI
end
return mp.CLEAN
