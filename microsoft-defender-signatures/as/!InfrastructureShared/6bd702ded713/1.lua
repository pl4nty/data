-- Threat: !InfrastructureShared
-- Name: 6bd702ded713
-- Type: 21

local l_0_0 = {
  ["winword.exe"] = true,
  ["excel.exe"] = true,
  ["powerpnt.exe"] = true,
  ["outlook.exe"] = true
}
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 ~= nil then
  for l_0_2 = 1, 4 do
    local l_0_3 = string.lower(l_0_1.image_path)
    local l_0_4 = l_0_3:match("([^\\]+)$")
    if l_0_0[l_0_4] then
      return mp.INFECTED
    else
      l_0_1 = mp.GetParentProcInfo(l_0_1.ppid)
      l_0_2 = l_0_2 + 1
    end
  end
end
return mp.CLEAN
