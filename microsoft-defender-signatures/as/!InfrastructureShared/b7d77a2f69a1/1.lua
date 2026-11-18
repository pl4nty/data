-- Threat: !InfrastructureShared
-- Name: b7d77a2f69a1
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "wscript.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
