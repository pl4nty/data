-- Threat: !InfrastructureShared
-- Name: 13dd74d52064b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if contains(l_0_1, {
    "\\papercut mf\\",
    "\\papercut ng\\"
  }) and contains(l_0_0.image_path, {
    "pc-app.exe",
    "pc-server.exe"
  }) then
    return mp.INFECTED
  end
end
return mp.CLEAN
