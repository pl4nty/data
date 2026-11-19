-- Threat: !InfrastructureShared
-- Name: 35b3f63af1df
-- Type: 21
-- Includes: BMLuaLib

if versioning.GetEngineBuild() < 16700 then
  return mp.CLEAN
end
local l_0_0 = versioning.GetOrgID()
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1, l_0_2 = bm.get_process_relationships()
if isnull(l_0_1) then
  return mp.CLEAN
end
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if not isnull(l_0_4.image_path) and mp.bitand(l_0_4.reason_ex, 2) == 2 then
    local l_0_5 = string.match(string.lower(l_0_4.image_path), "\\([^\\]+)$")
    if isnull(l_0_5) then
      return mp.CLEAN
    end
    if l_0_5 == "powershell.exe" or l_0_5 == "powershell_ise.exe" or l_0_5 == "pwsh.exe" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
