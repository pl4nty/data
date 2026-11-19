-- Threat: !InfrastructureShared
-- Name: 15295b523534
-- Type: 21
-- Includes: ScriptLuaLib

local l_0_0 = mp.getfilename()
if IsPathExcludedXplatML(l_0_0) ~= true then
  return mp.INFECTED
end
return mp.CLEAN
