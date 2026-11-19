-- Threat: !InfrastructureShared
-- Name: a3d778f00d38
-- Type: 21
-- Flags: 1

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if string.find(l_0_1, "explorer.exe") then
    return mp.LOWFI
  end
end
return mp.CLEAN
