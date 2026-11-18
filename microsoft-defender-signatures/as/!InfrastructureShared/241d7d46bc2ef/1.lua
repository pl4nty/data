-- Threat: !InfrastructureShared
-- Name: 241d7d46bc2ef
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^/]+)$") == "cybspawn.bin" then
    return mp.CLEAN
  end
end
return mp.INFECTED
