-- Threat: !InfrastructureShared
-- Name: 79d7b7f70a4d
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1:find("\225\181\150\225\181\131", 1, true) or l_0_1:find("\226\156\148\239\184\143", 1, true) or l_0_1:find("\225\181\141\225\181\137 http", 1, true) or l_0_1:find("upd%-%x%x%x%x%x%x%.vercel%.app/update%.msi%s+/qn") then
  local l_0_2 = mp.GetParentProcInfo()
  if l_0_2 ~= nil then
    local l_0_3 = string.lower(l_0_2.image_path)
    if string.find(l_0_3, "\\windows\\explorer.exe", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
