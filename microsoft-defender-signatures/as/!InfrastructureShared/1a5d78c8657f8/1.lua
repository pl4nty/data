-- Threat: !InfrastructureShared
-- Name: 1a5d78c8657f8
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if contains(l_0_1, {"\\usr\\sap\\"}) and string.sub(l_0_1, -11) == "\\jstart.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
