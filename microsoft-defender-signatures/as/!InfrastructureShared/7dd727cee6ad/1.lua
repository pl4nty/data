-- Threat: !InfrastructureShared
-- Name: 7dd727cee6ad
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["excel.exe"] = true,
    ["msaccess.exe"] = true,
    ["onenote.exe"] = true,
    ["powerpnt.exe"] = true,
    ["winword.exe"] = true
  }
  if not l_0_3[l_0_2] then
    return mp.CLEAN
  end
end
TrackPidAndTechnique("CMDHSTR", "T1559.001", "interprocess_com")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.INFECTED
end
return mp.LOWFI
