-- Threat: !InfrastructureShared
-- Name: 55b334962c3e
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[3].utf8p1
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[4].utf8p1
  l_0_0 = this_sigattrlog[4].utf8p2
end
local l_0_2 = bm.get_imagepath()
if l_0_2 ~= nil then
  l_0_2 = string.lower(string.sub(l_0_2, -50))
  if l_0_2 ~= nil and string.find(l_0_2, "\\root\\integration\\integrator.exe", 1, true) then
    return mp.CLEAN
  end
end
if l_0_1 and string.lower(string.sub(l_0_1, -3)) == "dll" then
  if l_0_0 then
    local l_0_3 = string.lower(string.match(l_0_0, "\\([^\\]+)$"))
    if l_0_3 ~= nil then
      local l_0_4 = {
        ["xapauthenticodesip.dll"] = "\\microsoft silverlight\\",
        ["wintrust.dll"] = "\\windows\\system32\\",
        ["wshext.dll"] = "\\windows\\system32\\",
        ["iiscertprovider.dll"] = "\\windows\\system32\\",
        ["emet_ce64.dll"] = "\\program files\\emet",
        ["emet_ce.dll"] = "\\program files\\emet",
        ["mscorsecimpl.dll"] = "\\windows\\microsoft.net\\framework",
        ["mcps.dll"] = "\\office1"
      }
      local l_0_5 = l_0_4[l_0_3]
      if l_0_5 ~= nil then
        local l_0_6 = mp.ContextualExpandEnvironmentVariables(l_0_0)
        if l_0_6 ~= nil then
          l_0_6 = string.lower(l_0_6)
          if l_0_6 ~= nil and string.find(l_0_6, l_0_5, 1, true) then
            return mp.CLEAN
          end
        end
      end
    end
    local l_0_7 = mp.GetExecutablesFromCommandLine(l_0_0)
    for l_0_8, l_0_9 in ipairs(l_0_7) do
      l_0_9 = mp.ContextualExpandEnvironmentVariables(l_0_9)
      if sysio.IsFileExists(l_0_9) then
        bm.add_related_file(l_0_9)
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
