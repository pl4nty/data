-- Threat: !InfrastructureShared
-- Name: 4a8d750d1a4a7
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if contains(l_0_1, {
    "\\papercut mf\\",
    "\\papercut ng\\"
  }) and string.sub(l_0_1, -10) == "pc-app.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
