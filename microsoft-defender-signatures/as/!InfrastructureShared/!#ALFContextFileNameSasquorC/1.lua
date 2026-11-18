-- Threat: !InfrastructureShared
-- Name: !#ALF:ContextFileNameSasquor.C
-- Type: 9

local l_0_0 = string.lower(mp.getfilename())
local l_0_1, l_0_2 = l_0_0:match("(.+\\)([^\\]+)$")
if l_0_2 == nil or l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1:len() > 20 and string.sub(l_0_1, -20) == "\\chrome\\application\\" then
  local l_0_3 = {
    ["winmm.dll"] = true,
    ["wtsapi32.dll"] = true,
    ["rpcrt4.dll"] = true,
    ["advapi32.dll"] = true,
    ["version.dll"] = true,
    ["userenv.dll"] = true,
    ["user32.dll"] = true,
    ["kernel32.dll"] = true,
    ["winhttp.dll"] = true
  }
  if l_0_3[l_0_2] then
    return mp.INFECTED
  end
end
return mp.CLEAN
