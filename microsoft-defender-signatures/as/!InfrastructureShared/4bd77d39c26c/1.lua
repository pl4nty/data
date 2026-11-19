-- Threat: !InfrastructureShared
-- Name: 4bd77d39c26c
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0.image_path ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:find("onenote.exe$") then
    return mp.INFECTED
  end
end
return mp.CLEAN
