-- Threat: !InfrastructureShared
-- Name: 82b3c9e47ac6
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = string.sub(l_0_1, -15):match("\\([^\\]+)$")
  local l_0_3 = {
    ["svchost.exe"] = true,
    ["taskeng.exe"] = true,
    ["taskhostw.exe"] = true
  }
  if l_0_3[l_0_2] then
    local l_0_4
    if this_sigattrlog[1].matched then
      l_0_4 = this_sigattrlog[1].utf8p2
    end
    if l_0_4 ~= nil then
      local l_0_5 = mp.GetExecutablesFromCommandLine(l_0_4)
      for l_0_6, l_0_7 in ipairs(l_0_5) do
        if l_0_7 ~= nil and l_0_7:len() > 3 and sysio.IsFileExists(l_0_7) and string.sub(l_0_7, -4) == ".wsf" then
          if string.sub(l_0_7, -15) == "iislogclean.wsf" then
            return mp.CLEAN
          end
          bm.add_threat_file(l_0_7)
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
