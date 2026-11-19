-- Threat: !InfrastructureShared
-- Name: e7d79bff0d66
-- Type: 21
-- Includes: LuaFuncHelper, ResearchData

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if l_0_1:match("([^\\]+)$") ~= "sdclt.exe" then
  return mp.CLEAN
end
local l_0_2 = sysio.RegExpandUserKey("HKCU\\Software\\CLASSES\\FOLDER\\SHELL\\OPEN\\COMMAND")
if l_0_2 then
  for l_0_3, l_0_4 in pairs(l_0_2) do
    if string.find(string.lower(l_0_4), "hkcu@s-1-5-21-", 1, true) then
      local l_0_5 = sysio.RegOpenKey(l_0_4)
      if l_0_5 then
        local l_0_6 = sysio.GetRegValueAsString(l_0_5, "")
        if l_0_6 then
          if string.len(l_0_6) < 4 and string.lower(l_0_6) ~= "cmd" then
            return mp.CLEAN
          end
          if string.find(l_0_6, "%1", 1, true) then
            return mp.CLEAN
          end
          if IsKeyInRollingQueue("uacbypass_regset", "sdclt", true) then
            set_research_data("DefaultValue", l_0_6, false)
            mp.set_mpattribute("MpDisableCaching")
            return mp.INFECTED
          end
        end
      end
    end
  end
end
return mp.CLEAN
