-- Threat: !InfrastructureShared
-- Name: 15b35e6ebbcf
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(string.sub(l_0_0, -18)):match("\\([^\\]+%.exe)$")
  local l_0_2 = {
    ["explorer.exe"] = true,
    ["chrome.exe"] = true,
    ["microsoftedge.exe"] = true,
    ["iexplore.exe"] = true,
    ["firefox.exe"] = true,
    ["cmd.exe"] = true,
    ["net.exe"] = true,
    ["winword.exe"] = true,
    ["excel.exe"] = true,
    ["onenote.exe"] = true,
    ["powerpnt.exe"] = true,
    ["teams.exe"] = true,
    ["notepad++.exe"] = true,
    ["powershell.exe"] = true
  }
  if l_0_2[l_0_1] then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
