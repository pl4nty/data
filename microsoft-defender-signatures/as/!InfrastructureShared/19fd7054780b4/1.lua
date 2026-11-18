-- Threat: !InfrastructureShared
-- Name: 19fd7054780b4
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:find("windows\\ccm\\", 1, true) then
    return mp.CLEAN
  end
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["ir_agent.exe"] = true,
    ["gpscript.exe"] = true,
    ["xendesktopvdasetup.exe"] = true,
    ["icaconfigconsole.exe"] = true,
    ["matrix42uemagentupdate.exe"] = true,
    ["sia2.exe"] = true,
    ["smsswd.exe"] = true,
    ["tsmanager.exe"] = true,
    ["ruby.exe"] = true,
    ["bpbkar32.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
end
TrackPidAndTechnique("CMDHSTR", "T1003.005", "creddiscovery")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.LOWFI
end
return mp.CLEAN
