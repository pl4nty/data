-- Threat: !InfrastructureShared
-- Name: 25b300720ccd
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  local l_0_1 = {
    ["powershell.exe"] = true,
    ["wscript.exe"] = true,
    ["cscript.exe"] = true,
    ["winword.exe"] = true,
    ["excel.exe"] = true,
    ["powerpnt.exe"] = true
  }
  local l_0_2 = string.match(l_0_0, "\\([^\\]+)$")
  if l_0_1[l_0_2] then
    return mp.INFECTED
  end
end
return mp.CLEAN
