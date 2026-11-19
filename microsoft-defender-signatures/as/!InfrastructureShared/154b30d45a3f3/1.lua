-- Threat: !InfrastructureShared
-- Name: 154b30d45a3f3
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and string.len(l_0_0) >= 15 then
  local l_0_1 = {
    ["cmd.exe"] = true,
    ["powershell.exe"] = true,
    ["cscript.exe"] = true,
    ["wscript.exe"] = true,
    ["mshta.exe"] = true,
    ["pwsh.exe"] = true,
    ["rundll32.exe"] = true,
    ["regsvr32.exe"] = true,
    ["regasm.exe"] = true,
    ["regsvcs.exe"] = true,
    ["officesvcmgr.exe"] = true,
    ["officeclicktorun.exe"] = true,
    ["integrator.exe"] = true
  }
  local l_0_2 = string.lower(l_0_0:match("\\([^\\]+)$"))
  if l_0_1[l_0_2] then
    return mp.CLEAN
  end
end
local l_0_3
if this_sigattrlog[14].matched and this_sigattrlog[14].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[14].utf8p2
end
if l_0_3 ~= nil then
  bm_AddRelatedFileFromCommandLine(l_0_3, nil, nil, 1)
  return mp.INFECTED
end
return mp.CLEAN
