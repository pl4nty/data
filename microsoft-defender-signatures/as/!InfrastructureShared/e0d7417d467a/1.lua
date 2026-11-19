-- Threat: !InfrastructureShared
-- Name: e0d7417d467a
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["microsoft.office.datacenter.torus.powershellworker.exe"] = true,
    ["citrix.wem.agent.service.exe"] = true,
    ["powershell_ise.exe"] = true,
    ["code.exe"] = true,
    ["ccmexec.exe"] = true,
    ["gpscript.exe"] = true,
    ["mpcmdrun.exe"] = true,
    ["mssense.exe"] = true,
    ["senseir.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
  if IsPidExcluded(l_0_0.ppid) then
    return mp.CLEAN
  end
  if IsDetectionThresholdMet(l_0_0.ppid) then
    return mp.INFECTED
  end
  return mp.LOWFI
end
return mp.CLEAN
