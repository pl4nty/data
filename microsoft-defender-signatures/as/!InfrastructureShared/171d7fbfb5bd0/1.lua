-- Threat: !InfrastructureShared
-- Name: 171d7fbfb5bd0
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["winword.exe"] = true,
    ["excel.exe"] = true,
    ["powerpnt.exe"] = true,
    ["outlook.exe"] = true,
    ["olk.exe"] = true,
    ["acrord32.exe"] = true,
    ["foxit.exe"] = true,
    ["thunderbird.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.INFECTED
  end
  if hstrlog[3].matched then
    local l_0_4 = {
      ["powershell.exe"] = true,
      ["pwsh.exe"] = true,
      ["cmd.exe"] = true,
      ["cscript.exe"] = true,
      ["wscript.exe"] = true,
      ["mshta.exe"] = true,
      ["chrome.exe"] = true,
      ["msedge.exe"] = true,
      ["firefox.exe"] = true,
      ["opera.exe"] = true,
      ["iexplore.exe"] = true,
      ["brave.exe"] = true,
      ["runtimebroker.exe"] = true
    }
    if l_0_4[l_0_2] then
      return mp.INFECTED
    end
  end
end
return mp.LOWFI
