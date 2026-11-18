-- Threat: !InfrastructureShared
-- Name: 11cd77b803e08
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = checkParentProcessNameFromListByPPIDRecursive("CMDHSTR", "|verodin_backend.exe|", 3)
if l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
