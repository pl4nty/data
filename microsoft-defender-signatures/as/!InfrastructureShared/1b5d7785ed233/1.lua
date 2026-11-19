-- Threat: !InfrastructureShared
-- Name: 1b5d7785ed233
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if string.find(l_0_1, "\\scrcons.exe", 1, true) then
    return mp.LOWFI
  end
end
return mp.CLEAN
